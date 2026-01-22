import { Component, signal, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HeaderComponent } from '../../shared/header/header';
import { Router } from '@angular/router';
import { LookupApiService } from '../../../services/lookup-api.service';
import { GovernorateData, LandOwnerData } from '../../../models/Lookup.Model';
import { LandTechnicalInspection } from '../../../models/landtechnicalinspection.model';
import { ErrorHandlerService } from '../../../services/error-handler.service';
import { LandTechnicalInspectionApiService } from '../../../services/land-technical-inspection-api.service';
import { LandApiService } from '../../../services/land-api.service';

type ViewMode = 'search' | 'view' | 'create' | 'edit';

@Component({
  selector: 'app-land-technical-inspection',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, HeaderComponent],
  templateUrl: './land-technical-inspection.html',
  styleUrl: './land-technical-inspection.css'
})

export class LandTechnicalInspectionComponent {

  private router = inject(Router);
  private lookupApiService = inject(LookupApiService);
  private errorHandler = inject(ErrorHandlerService);
  private landTechnicalInspectionApiService = inject(LandTechnicalInspectionApiService);
  private landApiService = inject(LandApiService);

  selectedLandTechnicalInspection = signal<LandTechnicalInspection | null>(null);
  viewMode = signal<ViewMode>('search');
  showDialog = signal<boolean>(false);
  dialogTitle = signal<string>('');
  dialogMessage = signal<string>('');
  dialogVariant = signal<'success' | 'error'>('success');
  private dialogRedirectToHomeAfterClose = false;
  technicalResponsiblePersonNameAndId: string;
  loggedInUser = JSON.parse(localStorage.getItem("currentUser") || '""');

  //Lookup
  governorates: GovernorateData[] = []; // Declare an empty array of MyObject
  landOwners: LandOwnerData[] = []; // Declare an empty array of MyObject
  landCodes: number[] = [];
  landCodeNotFound = false;

  get boundariesGroup() {
    return this.form.get('boundaries') as FormGroup;
  }
  get lengthsGroup() {
    return this.form.get('lengths') as FormGroup;
  }
  private fb = inject(FormBuilder);

  protected goBack(): void {
    this.router.navigate(['/property-registration-list-insertions']);
  }

  protected goHome(): void {
    this.router.navigate(['/dashboard']);
  }

  protected logout(): void {
    this.router.navigate(['/login']);
  }

  protected closeDialog(): void {
    this.showDialog.set(false);

    if (this.dialogRedirectToHomeAfterClose) {
      this.dialogRedirectToHomeAfterClose = false;
      this.goHome();
    }
  }

  private openDialog(variant: 'success' | 'error', title: string, message: string, redirectToHomeAfterClose = false): void {
    this.dialogVariant.set(variant);
    this.dialogTitle.set(title);
    this.dialogMessage.set(message);
    this.dialogRedirectToHomeAfterClose = redirectToHomeAfterClose;
    this.showDialog.set(true);
  }

  constructor() {
    this.loadGovernorates();
    this.loadLandOwners();
    this.loadLandCodes();

    this.technicalResponsiblePersonNameAndId = this.loggedInUser.id + ' ' + this.loggedInUser.fullName
  }

  form: FormGroup = this.fb.group({
    landCode: ['', [Validators.required, Validators.min(1)]],
    governorateCode: ['', [Validators.required, Validators.min(1)]],
    landAddress: ['', [Validators.required, Validators.maxLength(500)]],
    landOwnerName: ['', [Validators.required, Validators.minLength(3), Validators.maxLength(200)]],
    landOwnerAddress: ['', Validators.required],
    totalArea: ['', [Validators.required, Validators.min(1)]],
    landNature: ['مباني', Validators.required],
    landOwnershipCode: ['', [Validators.required, Validators.min(1)]],

    // الحدود
    northernBoundary: ['', Validators.required],
    southernBoundary: ['', Validators.required],
    easternBoundary: ['', Validators.required],
    westernBoundary: ['', Validators.required],

    // الأطوال
    northernBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    southernBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    easternBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    westernBoundaryLength: ['', [Validators.required, Validators.min(1)]],

    // الزوايا
    northeastBoundary: ['', Validators.required],
    northwestBoundary: ['', Validators.required],
    southeastBoundary: ['', Validators.required],
    southwestBoundary: ['', Validators.required],

    // أطوال الزوايا
    northeastBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    northwestBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    southeastBoundaryLength: ['', [Validators.required, Validators.min(1)]],
    southwestBoundaryLength: ['', [Validators.required, Validators.min(1)]],

    technicalResponsiblePersonId: [this.loggedInUser.id, Validators.required],
    legalResponsiblePersonId: ['', [Validators.required, Validators.min(1)]],
    needsCommitteeDate: ['', Validators.required],
    technicalInspectionDate: ['', Validators.required]
  });

  private loadLandCodes(): void {
    this.landApiService.getAvailableLandCodes().subscribe({
      next: (codes) => {
        this.landCodes = codes || [];
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(error, 'تحميل أكواد الأراضي المتاحة');
        this.openDialog('error', 'خطأ', errorMessage);
      }
    });
  }

  protected onLandCodeChanged(): void {
    const raw = this.form.get('landCode')?.value;
    const landCode = Number(raw);
    if (!landCode || Number.isNaN(landCode)) {
      this.landCodeNotFound = false;
      return;
    }

    if (this.landCodes.length > 0 && !this.landCodes.includes(landCode)) {
      this.landCodeNotFound = true;
      return;
    }

    this.landCodeNotFound = false;
  }

  private applyServerValidationErrors(error: any): void {
    const errors = error?.error?.errors;
    if (!errors || typeof errors !== 'object') {
      return;
    }

    Object.keys(errors).forEach((key) => {
      const messages = Array.isArray(errors[key]) ? errors[key] : [errors[key]];
      const message = messages.find((m: any) => typeof m === 'string' && m.trim().length > 0) ?? null;
      if (!message) {
        return;
      }

      const normalizedKey = (key ?? '').toString();
      const candidateNames = [
        normalizedKey,
        normalizedKey.length > 0 ? normalizedKey[0].toLowerCase() + normalizedKey.slice(1) : '',
        normalizedKey.toLowerCase()
      ].filter(Boolean);

      const formControls = Object.keys(this.form.controls);
      const matchedControlName = formControls.find(c => candidateNames.some(k => k === c || k.toLowerCase() === c.toLowerCase()));
      if (!matchedControlName) {
        return;
      }

      const control = this.form.get(matchedControlName);
      if (!control) {
        return;
      }

      control.setErrors({ ...(control.errors ?? {}), server: message });
      control.markAsTouched();
    });
  }

  private loadLandOwners() {
    this.lookupApiService.getLandOwners().subscribe({
      next: (landOwnersList) => {
        // Guard against null and normalize the response to an array
        if (!landOwnersList) {
          this.landOwners = [];
          return;
        }
        this.landOwners = Array.isArray(landOwnersList) ? landOwnersList : [landOwnersList];
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'تحميل أصحاب الأراضي'
        );
        this.openDialog('error', 'خطأ', errorMessage);
      }
    });
  }

  private loadGovernorates() {
    this.lookupApiService.getGovernorates().subscribe({
      next: (governoratesList) => {
        // Guard against null and normalize the response to an array
        if (!governoratesList) {
          this.governorates = [];
          return;
        }
        this.governorates = Array.isArray(governoratesList) ? governoratesList : [governoratesList];
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'تحميل المحافظات'
        );
        this.openDialog('error', 'خطأ', errorMessage);
      }
    });
  }

  protected submit(): void {
    this.form.setErrors(null);

    Object.keys(this.form.controls).forEach((k) => {
      const c = this.form.get(k);
      if (!c || !c.errors || !c.errors['server']) {
        return;
      }
      const { server, ...rest } = c.errors;
      c.setErrors(Object.keys(rest).length > 0 ? rest : null);
    });

    this.onLandCodeChanged();
    if (this.landCodeNotFound) {
      this.form.get('landCode')?.setErrors({ ...(this.form.get('landCode')?.errors ?? {}), server: 'لا توجد قطعة أرض بهذا الكود في جدول الأراضي.' });
      this.form.get('landCode')?.markAsTouched();
      return;
    }

    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }

    this.landTechnicalInspectionApiService.saveLandTechnicalInspection(this.form.value).subscribe({
      next: (landTechnicalInspection) => {
        this.selectedLandTechnicalInspection.set(landTechnicalInspection);
        this.viewMode.set('view');

        // Send form data to backend -- currently logging and clearing form
        console.log('Land inspection data submitted', this.form.value);
        this.form.reset();
        this.openDialog('success', 'تم الحفظ', 'تم حفظ بيانات المعاينة الفنية للأرض بنجاح!', true);
      },
      error: (error) => {
        console.error('Error creating building:', error);

        this.applyServerValidationErrors(error);

        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'إضافة معاينة فنية للأرض'
        );
        this.openDialog('error', 'فشل الحفظ', `فشل في إضافة معاينة فنية للأرض:\n${errorMessage}`);
      }
    });
  }
}