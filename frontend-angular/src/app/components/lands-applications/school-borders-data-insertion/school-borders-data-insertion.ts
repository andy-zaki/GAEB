import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { Router } from '@angular/router';
import { HeaderComponent } from '../../shared/header/header';
import { SchoolMapApiService } from '../../../services/school-map-api.service';
import { ErrorHandlerService } from '../../../services/error-handler.service';
import { Border, EducationalBuildingInfo, EducationalBuilding } from '../../../models/school-map.model';

@Component({
  selector: 'school-borders-data-insertion',
  standalone: true,
  templateUrl: './school-borders-data-insertion.html',
  styleUrls: ['./school-borders-data-insertion.css'],
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent]
})
export class SchoolBordersDataInsertionComponent {

  searchForm: FormGroup;
  borderForm: FormGroup;
  buildingInfoForm: FormGroup;

  borders: Border[] = [];
  buildingId: string | null = null;
  buildingData: EducationalBuilding | null = null;
  buildingInfo: EducationalBuildingInfo | null = null;

  showModal = false;
  showBuildingInfoModal = false;
  editingIndex: number | null = null;
  loading = false;

  // Border names (directions)
  availableBorderNames = [
    'الحد الشمالي',
    'الحد الجنوبي',
    'الحد الشرقي',
    'الحد الغربي',
    'الحد الشمالي الشرقي',
    'الحد الشمالي الغربي',
    'الحد الجنوبي الشرقي',
    'الحد الجنوبي الغربي'
  ];


  constructor(
    private fb: FormBuilder,
    private api: SchoolMapApiService,
    private router: Router,
    private errorHandler: ErrorHandlerService
  ) {
    this.searchForm = this.fb.group({
      buildingNumber: ['', Validators.required]
    });

    this.borderForm = this.fb.group({
      boundaryName: ['', [Validators.required, this.uniqueBorderNameValidator.bind(this)]],
      length: [0, [Validators.required, Validators.min(0)]],
      neighborFound: [true],
      neighborLevel: [null],
      neighborDescription: [''],
      hasFence: [false]
    });

    this.buildingInfoForm = this.fb.group({
      buildingName: [''],
      averageSiteLevel: [null],
      highestPointLevel: [null],
      proposedCourtyardLevel: [null],
      lowestPointLevel: [null]
    });
  }

  /* ===================== Navigation ===================== */

  goBack(): void {
    this.router.navigate(['/lands-main-menu']);
  }

  goHome(): void {
    this.router.navigate(['/dashboard']);
  }

  logout(): void {
    this.router.navigate(['/login']);
  }

  /* ===================== Search ===================== */

  search(): void {
    if (this.searchForm.invalid) return;

    this.loading = true;
    this.borders = [];
    this.buildingData = null;
    this.buildingId = null;

    const buildingNumber = this.searchForm.value.buildingNumber;

    this.api.getEducationalBuildingDetails(buildingNumber).subscribe({
      next: (res) => {
        this.buildingId = res.id;
        this.buildingData = res;
        this.borders = res.borders ?? [];
        
        // Get the first info or create empty one
        this.buildingInfo = res.infos && res.infos.length > 0 ? res.infos[0] : {
          id: undefined,
          averageSiteLevel: undefined,
          highestPointLevel: undefined,
          proposedCourtyardLevel: undefined,
          lowestPointLevel: undefined
        };
        
        // Populate building info form
        this.buildingInfoForm.patchValue({
          buildingName: res.buildingName || '',
          averageSiteLevel: this.buildingInfo?.averageSiteLevel || null,
          highestPointLevel: this.buildingInfo?.highestPointLevel || null,
          proposedCourtyardLevel: this.buildingInfo?.proposedCourtyardLevel || null,
          lowestPointLevel: this.buildingInfo?.lowestPointLevel || null
        });
        
        this.loading = false;
      },
      error: (err) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          err,
          'البحث عن المبنى التعليمي'
        );
        alert(errorMessage);
        this.loading = false;
      }
    });
  }

  /* ===================== Unique Border Name Validator ===================== */

  uniqueBorderNameValidator(control: AbstractControl): ValidationErrors | null {
    if (!control.value) {
      return null;
    }
    
    if (this.editingIndex === null) {
      // Check if name already exists when adding new border
      const exists = this.borders.some(b => b.boundaryName === control.value);
      return exists ? { duplicateName: true } : null;
    } else {
      // When editing, check if name exists in other borders
      const exists = this.borders.some((b, index) => 
        index !== this.editingIndex && b.boundaryName === control.value
      );
      return exists ? { duplicateName: true } : null;
    }
  }

  /* ===================== Get Available Border Names ===================== */

  getAvailableBorderNames(): string[] {
    if (this.editingIndex !== null) {
      // When editing, show all names except the ones used by other borders
      const currentBorderName = this.borders[this.editingIndex]?.boundaryName;
      const usedNames = this.borders
        .filter((b, index) => index !== this.editingIndex)
        .map(b => b.boundaryName);
      return this.availableBorderNames.filter(name => 
        name === currentBorderName || !usedNames.includes(name)
      );
    } else {
      // When adding, show only unused names
      const usedNames = this.borders.map(b => b.boundaryName);
      return this.availableBorderNames.filter(name => !usedNames.includes(name));
    }
  }

  /* ===================== Modal ===================== */

  openModal(border?: Border, index?: number): void {
    if (border) {
      this.borderForm.patchValue(border);
      this.editingIndex = index!;
    } else {
      this.borderForm.reset({
        boundaryName: '',
        length: 0,
        neighborFound: true,
        neighborLevel: null,
        neighborDescription: '',
        hasFence: false
      });
      this.editingIndex = null;
    }
    // Re-validate border name
    this.borderForm.get('boundaryName')?.updateValueAndValidity();
    this.showModal = true;
  }

  closeModal(): void {
    this.showModal = false;
    this.borderForm.reset({
      boundaryName: '',
      length: 0,
      neighborFound: true,
      neighborLevel: null,
      neighborDescription: '',
      hasFence: false
    });
    this.editingIndex = null;
  }

  openBuildingInfoModal(): void {
    this.showBuildingInfoModal = true;
  }

  closeBuildingInfoModal(): void {
    this.showBuildingInfoModal = false;
  }

  /* ===================== Save Border ===================== */

  submitBorder(): void {
    if (!this.buildingId || this.borderForm.invalid) {
      if (this.borderForm.get('boundaryName')?.hasError('duplicateName')) {
        alert('⚠️ يوجد حد بنفس الاسم بالفعل. لا يمكن إضافة حدين بنفس الاسم.');
      }
      return;
    }

    const borderData: any = {
      boundaryName: String(this.borderForm.value.boundaryName || '').trim(),
      length: Number(this.borderForm.value.length) || 0,
      neighborFound: Boolean(this.borderForm.value.neighborFound),
      neighborDescription: String(this.borderForm.value.neighborDescription || ''),
      hasFence: Boolean(this.borderForm.value.hasFence)
    };
    
    // Only include neighborLevel if it has a value
    if (this.borderForm.value.neighborLevel != null && this.borderForm.value.neighborLevel !== '') {
      borderData.neighborLevel = Number(this.borderForm.value.neighborLevel);
    }

    if (this.editingIndex !== null) {
      const existing = this.borders[this.editingIndex];

      this.api.updateEducationalBuildingBorder(
        this.buildingId,
        existing.id!,
        borderData
      ).subscribe({
        next: (updated) => {
          this.borders[this.editingIndex!] = updated;
          this.closeModal();
          alert('✅ تم تحديث بيانات الحد بنجاح');
        },
        error: (err) => {
          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            err,
            'تحديث الحد'
          );
          alert(errorMessage);
        }
      });

    } else {
      this.api.addEducationalBuildingBorder(this.buildingId, borderData).subscribe({
        next: (created) => {
          this.borders.push(created);
          // Update validator after adding border
          this.borderForm.get('boundaryName')?.updateValueAndValidity();
          this.closeModal();
          alert('✅ تم إضافة الحد بنجاح');
        },
        error: (err) => {
          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            err,
            'إضافة الحد'
          );
          if (err.error?.message?.includes('BoundaryName') || err.error?.message?.includes('اسم الحد')) {
            alert('⚠️ يوجد حد بنفس الاسم بالفعل. لا يمكن إضافة حدين بنفس الاسم.');
          } else {
            alert(errorMessage);
          }
        }
      });
    }
  }

  /* ===================== Save Building Info ===================== */

  submitBuildingInfo(): void {
    if (!this.buildingId) return;

    const infoData: any = {
      averageSiteLevel: Number(this.buildingInfoForm.value.averageSiteLevel) || 0,
      highestPointLevel: Number(this.buildingInfoForm.value.highestPointLevel) || 0,
      proposedCourtyardLevel: Number(this.buildingInfoForm.value.proposedCourtyardLevel) || 0,
      lowestPointLevel: Number(this.buildingInfoForm.value.lowestPointLevel) || 0
    };

    // Only include id if updating existing info
    if (this.buildingInfo?.id) {
      infoData.id = this.buildingInfo.id;
    }

    // Update building info
    this.api.updateEducationalBuildingInfo(this.buildingId, infoData).subscribe({
      next: (updated) => {
        this.buildingInfo = updated;
        if (this.buildingData) {
          if (!this.buildingData.infos) {
            this.buildingData.infos = [];
          }
          const index = this.buildingData.infos.findIndex(i => i.id === updated.id);
          if (index >= 0) {
            this.buildingData.infos[index] = updated;
          } else {
            this.buildingData.infos.push(updated);
          }
        }

        // Update building name if changed
        if (this.buildingId && this.buildingData && this.buildingData.buildingName !== this.buildingInfoForm.value.buildingName) {
          this.api.updateEducationalBuilding(this.buildingId, {
            buildingName: this.buildingInfoForm.value.buildingName
          }).subscribe({
            next: (updatedBuilding) => {
              if (this.buildingData) {
                this.buildingData.buildingName = updatedBuilding.buildingName;
              }
              this.closeBuildingInfoModal();
              alert('✅ تم تحديث بيانات المبنى التعليمي بنجاح');
            },
            error: (err) => {
              const errorMessage = this.errorHandler.getUserFriendlyMessage(
                err,
                'تحديث اسم المبنى'
              );
              alert(`تم تحديث بيانات المنسوب بنجاح، لكن حدث خطأ في تحديث اسم المبنى: ${errorMessage}`);
            }
          });
        } else {
          this.closeBuildingInfoModal();
          alert('✅ تم تحديث بيانات المبنى التعليمي بنجاح');
        }
      },
      error: (err) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          err,
          'تحديث بيانات المبنى'
        );
        alert(errorMessage);
      }
    });
  }

  /* ===================== Delete ===================== */

  deleteBorder(index: number): void {
    if (!this.buildingId) return;

    const border = this.borders[index];
    if (!confirm('هل أنت متأكد من حذف هذا الحد؟')) return;

    this.api.deleteEducationalBuildingBorder(this.buildingId, border.id!)
      .subscribe({
        next: () => {
          this.borders.splice(index, 1);
          alert('✅ تم حذف الحد بنجاح');
        },
        error: (err) => {
          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            err,
            'حذف الحد'
          );
          alert(errorMessage);
        }
      });
  }
}
