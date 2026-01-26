import { Component, inject, ChangeDetectionStrategy } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { HeaderComponent } from '../shared/header/header';
import { SchoolMapApiService } from '../../services/school-map-api.service';
import { ErrorHandlerService } from '../../services/error-handler.service';

@Component({
  selector: 'app-building-basic-data',
  templateUrl: './building-basic-data.html',
  styleUrl: './building-basic-data.css',
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class BuildingBasicDataComponent {
  private router = inject(Router);
  private fb = inject(FormBuilder);
  private schoolMapApiService = inject(SchoolMapApiService);
  private errorHandler = inject(ErrorHandlerService);

  buildingForm: FormGroup;

  positiveEnvironments = [
    { code: '1', name: 'الفترات الدراسية' },
    { code: '2', name: 'حدود الموقع العام' },
    { code: '3', name: 'الملاعب' },
    { code: '4', name: 'البوبات' },
    { code: '5', name: 'الملاحق' },
    { code: '6', name: 'المساحات' },
    { code: '7', name: 'شبكات الحريق' },
    { code: '8', name: 'المناسيب' },
    { code: '9', name: 'التغذية بالمياه' },
    { code: '10', name: 'الغاز الطبيعي' },
    { code: '11', name: 'الصرف الصحي' },
    { code: '12', name: 'التوصيلات الكهربائية' },
    { code: '13', name: 'التجهيزات الصحية' },
    { code: '14', name: 'الفراغات' }
  ];

  negativeEnvironments = [
    { code: '1', name: 'الفترات الدراسية' },
    { code: '2', name: 'حدود الموقع العام' },
    { code: '3', name: 'الملاعب' },
    { code: '4', name: 'البوبات' },
    { code: '5', name: 'الملاحق' },
    { code: '6', name: 'المساحات' },
    { code: '7', name: 'شبكات الحريق' },
    { code: '8', name: 'المناسيب' },
    { code: '9', name: 'التغذية بالمياه' },
    { code: '10', name: 'الغاز الطبيعي' },
    { code: '11', name: 'الصرف الصحي' },
    { code: '12', name: 'التوصيلات الكهربائية' },
    { code: '13', name: 'التجهيزات الصحية' },
    { code: '14', name: 'الفراغات' }
  ];

  constructor() {
    this.buildingForm = this.fb.group({
      buildingNumber: ['', [Validators.required]],
      usageStatus: ['', [Validators.required]],
      addressNumber: ['', [Validators.required]],
      street: ['', [Validators.required]],
      phoneNumber: ['', [Validators.required]],
      landOwnership: ['', [Validators.required]],
      buildingOwnership: ['', [Validators.required]],
      fenceCode: ['', [Validators.required]],
      fenceHeight: ['', [Validators.required]],
      fenceCondition: ['', [Validators.required]],
      northSide: ['', [Validators.required]],
      southSide: ['', [Validators.required]],
      eastSide: ['', [Validators.required]],
      westSide: ['', [Validators.required]],
      northEast: ['', [Validators.required]],
      southEast: ['', [Validators.required]],
      northWest: ['', [Validators.required]],
      southWest: ['', [Validators.required]],
      buildingMaterial: ['', [Validators.required]],
      coordinateX: ['', [Validators.required]],
      coordinateY: ['', [Validators.required]],
      coordinateZ: ['', [Validators.required]],
      positiveEnvironment: ['', [Validators.required]],
      negativeEnvironment: ['', [Validators.required]]
    });
  }

  onSubmit() {
    if (this.buildingForm.valid) {
      const formData = this.buildingForm.value;

      const buildingNumber = (formData.buildingNumber ?? '').toString();
      const payload = {
        buildingNumber,
        usageStatus: formData.usageStatus,
        addressNumber: formData.addressNumber,
        street: formData.street,
        phoneNumber: formData.phoneNumber,
        landOwnership: formData.landOwnership,
        buildingOwnership: formData.buildingOwnership,
        fenceCode: formData.fenceCode,
        fenceHeight: formData.fenceHeight === null || formData.fenceHeight === undefined || formData.fenceHeight === '' ? null : Number(formData.fenceHeight),
        fenceCondition: formData.fenceCondition,
        northSide: (formData.northSide ?? '').toString(),
        southSide: (formData.southSide ?? '').toString(),
        eastSide: (formData.eastSide ?? '').toString(),
        westSide: (formData.westSide ?? '').toString(),
        northEast: (formData.northEast ?? '').toString(),
        southEast: (formData.southEast ?? '').toString(),
        northWest: (formData.northWest ?? '').toString(),
        southWest: (formData.southWest ?? '').toString(),
        buildingMaterial: formData.buildingMaterial,
        coordinateX: formData.coordinateX === null || formData.coordinateX === undefined || formData.coordinateX === '' ? null : Number(formData.coordinateX),
        coordinateY: formData.coordinateY === null || formData.coordinateY === undefined || formData.coordinateY === '' ? null : Number(formData.coordinateY),
        coordinateZ: formData.coordinateZ === null || formData.coordinateZ === undefined || formData.coordinateZ === '' ? null : Number(formData.coordinateZ),
        positiveEnvironment: formData.positiveEnvironment,
        negativeEnvironment: formData.negativeEnvironment,
      };

      this.schoolMapApiService.upsertEducationalBuildingByNumber(buildingNumber, payload as any).subscribe({
        next: (saved: any) => {
          console.log('Building basic data saved:', saved);
          alert('✅ تم حفظ البيانات الأساسية للمبنى بنجاح!');
          this.buildingForm.reset();
        },
        error: (error: any) => {
          console.error('Error saving building data:', error);
          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            error,
            'حفظ البيانات الأساسية للمبنى'
          );
          alert(errorMessage);
        }
      });
    } else {
      this.markFormGroupTouched(this.buildingForm);
      alert('⚠️ الرجاء ملء جميع الحقول المطلوبة');
    }
  }

  onReset() {
    this.buildingForm.reset();
  }

  private markFormGroupTouched(formGroup: FormGroup) {
    Object.keys(formGroup.controls).forEach(key => {
      const control = formGroup.get(key);
      control?.markAsTouched();
    });
  }

  navigateBack() {
    this.router.navigate(['/building-data-completion']);
  }

  goHome() {
    this.router.navigate(['/dashboard']);
  }

  logout() {
    this.router.navigate(['/login']);
  }
}
