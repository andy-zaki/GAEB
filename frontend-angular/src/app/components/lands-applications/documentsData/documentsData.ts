import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HeaderComponent } from '../../shared/header/header';
import { Router } from '@angular/router';
import { ErrorHandlerService } from '../../../services/error-handler.service';
import { DocumentsDataApiService, BuildingDocumentRowDto, BuildingLookupDto, MasterDocumentDto } from '../../../services/documents-data-api.service';

@Component({
  selector: 'documentsData',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, FormsModule, HeaderComponent],
  templateUrl: './documentsData.html',
  styleUrl: './documentsData.css'
})
export class DocumentsData {
  private readonly router = inject(Router);
  private readonly fb = inject(FormBuilder);
  private documentsDataApi = inject(DocumentsDataApiService);
  private errorHandler = inject(ErrorHandlerService);

  form: FormGroup = this.fb.group({
    buildingNumber: ['', Validators.required]
  });

  buildingNumbers: BuildingLookupDto[] = [];
  isLoadingBuildingNumbers = false;
  isLoadingDocuments = false;
  availableDocuments: BuildingDocumentRowDto[] = [];
  buildingNumberNotFound = false;

  masterDocuments: MasterDocumentDto[] = [];
  isLoadingMasterDocuments = false;
  newMasterName = '';
  newMasterCode = '';
  editingMasterId: number | null = null;
  editingMasterName = '';
  editingMasterCode = '';

  showDocumentsAdmin = false;

  // per-row selection validation flags
  selectionErrors: boolean[] = [];

  constructor() {
    this.loadBuildingNumbers();
    this.loadMasterDocuments();
  }

  protected toggleDocumentsAdmin(): void {
    this.showDocumentsAdmin = !this.showDocumentsAdmin;
  }

  private loadMasterDocuments(): void {
    this.isLoadingMasterDocuments = true;
    this.documentsDataApi.getMasterDocuments().subscribe({
      next: (docs) => {
        this.masterDocuments = docs || [];
        this.isLoadingMasterDocuments = false;
      },
      error: () => {
        this.isLoadingMasterDocuments = false;
      }
    });
  }

  protected createMasterDocument(): void {
    const name = (this.newMasterName || '').trim();
    const documentCode = (this.newMasterCode || '').trim();
    if (!name) {
      alert('اسم المستند مطلوب');
      return;
    }

    this.documentsDataApi.createMasterDocument({
      name,
      documentCode: documentCode ? documentCode : null
    }).subscribe({
      next: () => {
        alert('✅ تم إضافة المستند بنجاح');
        this.newMasterName = '';
        this.newMasterCode = '';
        this.loadMasterDocuments();
        this.onBuildingNumberChanged();
      },
      error: () => {
        alert('حدث خطأ أثناء إضافة المستند');
      }
    });
  }

  protected startEditMaster(doc: MasterDocumentDto): void {
    this.editingMasterId = doc.id;
    this.editingMasterName = doc.name;
    this.editingMasterCode = doc.documentCode || '';
  }

  protected cancelEditMaster(): void {
    this.editingMasterId = null;
    this.editingMasterName = '';
    this.editingMasterCode = '';
  }

  protected saveEditMaster(): void {
    if (this.editingMasterId == null) {
      return;
    }

    const name = (this.editingMasterName || '').trim();
    const documentCode = (this.editingMasterCode || '').trim();
    if (!name) {
      alert('اسم المستند مطلوب');
      return;
    }

    this.documentsDataApi.updateMasterDocument(this.editingMasterId, {
      name,
      documentCode: documentCode ? documentCode : null
    }).subscribe({
      next: () => {
        alert('✅ تم تعديل المستند بنجاح');
        this.cancelEditMaster();
        this.loadMasterDocuments();
        this.onBuildingNumberChanged();
      },
      error: () => {
        alert('حدث خطأ أثناء تعديل المستند');
      }
    });
  }

  protected deleteMasterDocument(id: number): void {
    const ok = confirm('هل أنت متأكد من حذف هذا المستند؟');
    if (!ok) {
      return;
    }

    this.documentsDataApi.deleteMasterDocument(id).subscribe({
      next: () => {
        alert('✅ تم حذف المستند بنجاح');
        if (this.editingMasterId === id) {
          this.cancelEditMaster();
        }
        this.loadMasterDocuments();
        this.onBuildingNumberChanged();
      },
      error: () => {
        alert('حدث خطأ أثناء حذف المستند');
      }
    });
  }

  private loadBuildingNumbers(): void {
    this.isLoadingBuildingNumbers = true;
    this.documentsDataApi.getBuildingNumbers().subscribe({
      next: (numbers) => {
        this.buildingNumbers = (numbers || []).filter(x => (x?.buildingNumber ?? '').toString().trim().length > 0);
        this.isLoadingBuildingNumbers = false;
      },
      error: () => {
        this.isLoadingBuildingNumbers = false;
      }
    });
  }

  protected onBuildingNumberChanged(): void {
    const raw = (this.form.get('buildingNumber')?.value ?? '').toString().trim();
    const buildingNumber = raw;
    if (!buildingNumber) {
      this.availableDocuments = [];
      this.selectionErrors = [];
      this.buildingNumberNotFound = false;
      return;
    }

    const knownNumbers = this.buildingNumbers.map(x => x.buildingNumber);
    if (knownNumbers.length > 0 && !knownNumbers.includes(buildingNumber)) {
      this.availableDocuments = [];
      this.selectionErrors = [];
      this.buildingNumberNotFound = true;
      return;
    }

    this.buildingNumberNotFound = false;

    this.isLoadingDocuments = true;
    this.documentsDataApi.getDocumentsByBuildingNumber(buildingNumber).subscribe({
      next: (docs) => {
        this.availableDocuments = docs || [];
        this.selectionErrors = new Array(this.availableDocuments.length).fill(false);
        this.isLoadingDocuments = false;
      },
      error: () => {
        this.availableDocuments = [];
        this.selectionErrors = [];
        this.isLoadingDocuments = false;
      }
    });
  }

  protected goBack(): void {
    this.router.navigate(['/recording-data-for-impactful-oceans']);
  }

  protected goHome(): void {
    this.router.navigate(['/dashboard']);
  }

  protected logout(): void {
    this.router.navigate(['/login']);
  }

  submit(): void {
    // validate that each document row has one selection
    if (!this.validateDocumentSelections()) {
      this.form.markAllAsTouched();
      return;
    }

    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }

    const buildingNumber = (this.form.get('buildingNumber')?.value ?? '').toString().trim();
    if (!buildingNumber) {
      return;
    }

    const payload = {
      buildingNumber,
      documents: this.availableDocuments.map(d => ({
        documentId: d.documentId,
        exist: d.exist,
        doesNotExist: d.doesNotExist,
        notRequired: d.notRequired
      }))
    };

    this.documentsDataApi.saveBuildingDocuments(payload).subscribe({
      next: () => {
        alert('✅ تم حفظ بيانات المستندات وربطها بالمبنى بنجاح!');
        this.goHome();
      },
      error: () => {
        alert('حدث خطأ أثناء حفظ بيانات المستندات. حاول مرة أخرى.');
      }
    });
  }

  validateDocumentSelections(): boolean {
    this.selectionErrors = [];
    let allOk = true;
    this.availableDocuments.forEach((doc, idx) => {
      const hasSelection = !!(doc.exist || doc.doesNotExist || doc.notRequired);
      this.selectionErrors[idx] = !hasSelection;
      if (!hasSelection) { allOk = false; }
    });
    return allOk;
  }

  onDocSelection(index: number): void {
    this.selectionErrors[index] = false;
  }
}
