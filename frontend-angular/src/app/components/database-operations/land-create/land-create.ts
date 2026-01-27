import { CommonModule } from '@angular/common';
import { Component, inject, signal } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HeaderComponent } from '../../shared/header/header';
import { ErrorHandlerService } from '../../../services/error-handler.service';
import { LandApiService } from '../../../services/land-api.service';

type DialogVariant = 'success' | 'error';

@Component({
  selector: 'app-land-create',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent],
  templateUrl: './land-create.html',
  styleUrl: './land-create.css'
})
export class LandCreateComponent {
  private readonly router = inject(Router);
  private readonly fb = inject(FormBuilder);
  private readonly landApiService = inject(LandApiService);
  private readonly errorHandler = inject(ErrorHandlerService);

  showDialog = signal<boolean>(false);
  dialogTitle = signal<string>('');
  dialogMessage = signal<string>('');
  dialogVariant = signal<DialogVariant>('success');

  form: FormGroup = this.fb.group({
    landCode: [null, [Validators.required, Validators.min(1)]],
    referenceNumber: [null],
    usageStatus: [null],
    headquarters: [null],
    approvalStatus: [null],
    identificationNumber: [null],
    centerDepartment: [null],
    totalArea: [null],
    phase: [null],
    approval: [null],
    housing: [null],
    committeePricing: [null],
    purchasePrice: [null],
    saleNegotiations: [null],
    village: [null],
    currentOwner: [null],
    originalOwner: [null],
    model: [null],
    documents: [null],
    plan: [null],
    branchNotification: [null],
    realEstateStatus: [null],
    buildingBoundaries: [null],
    networkData: [null],
    networkObservations: [null],
    landAreaFromTotal: [null],
    landUseDatabase: [null],
    landInspectionDatabase: [null],
    landConstructionObstacles: [null],
    landCreationObstacles: [null],
    landConstructionData: [null],
    landReceiptDatabase: [null],
    paidAmountsDatabase: [null],
    decisionData: [null],
    landCommittees: [null],
    landFacilities: [null],
    landCoordinatesData: [null],
    educationalStudies: [null],
    landReviewCommittees: [null],

    north: [null],
    south: [null],
    east: [null],
    west: [null],

    lengthNorth: [null],
    lengthSouth: [null],
    lengthEast: [null],
    lengthWest: [null],

    ne: [null],
    nw: [null],
    se: [null],
    sw: [null],

    lengthNe: [null],
    lengthNw: [null],
    lengthSe: [null],
    lengthSw: [null]
  });

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
  }

  private openDialog(variant: DialogVariant, title: string, message: string): void {
    this.dialogVariant.set(variant);
    this.dialogTitle.set(title);
    this.dialogMessage.set(message);
    this.showDialog.set(true);
  }

  private getFieldLabel(fieldName: string): string {
    const labels: Record<string, string> = {
      referenceNumber: 'الرقم المرجعي',
      usageStatus: 'حالة الاستخدام / موقف الاستخدام',
      headquarters: 'المقر',
      approvalStatus: 'حالة الموافقة',
      identificationNumber: 'الرقم التعريفي',
      centerDepartment: 'المركز/القسم',
      totalArea: 'المساحة الكلية',
      phase: 'المرحلة',
      approval: 'الاعتماد',
      housing: 'التسكين',
      committeePricing: 'تسعير اللجنة',
      purchasePrice: 'سعر الشراء',
      saleNegotiations: 'مفاوضات البيع',
      landCode: 'كود الأرض',
      village: 'القرية',
      currentOwner: 'المالك الحالي',
      originalOwner: 'المالك الأصلي',
      model: 'النموذج',
      documents: 'الوثائق / المستندات',
      plan: 'الخطة',
      branchNotification: 'إخطار الفرع',
      realEstateStatus: 'موقف العقارية',
      buildingBoundaries: 'حدود قطعة الأرض',
      networkData: 'بيانات الميزانية الشبكية',
      networkObservations: 'ملاحظات الميزانية الشبكية',
      landAreaFromTotal: 'مساحة الأرض من الإجمالي',
      landUseDatabase: 'قاعدة بيانات استخدام الأراضي',
      landInspectionDatabase: 'ملاحظات معاينة قطعة الارض',
      landConstructionObstacles: 'معوقات البناء بالأرض',
      landCreationObstacles: 'عوائق إنشاء قطعة الارض',
      landConstructionData: 'مستندات قطعة الارض',
      landReceiptDatabase: 'موقف استلام قطعة الارض',
      paidAmountsDatabase: 'المبالغ المدفوعة للأرض',
      decisionData: 'بيانات قرار التخصيص',
      landCommittees: 'لجان قطعة الارض',
      landFacilities: 'مرافق قطعة الارض',
      landCoordinatesData: 'احداثيات قطعة الارض',
      educationalStudies: 'الدراسات التربوية',
      landReviewCommittees: 'لجان مراجعة قطعة الارض'
    };

    return labels[fieldName] ?? fieldName;
  }

  protected getInvalidFieldsMessage(): string {
    const invalidFields: string[] = [];
    Object.keys(this.form.controls).forEach(key => {
      const control = this.form.get(key);
      if (control?.invalid) {
        invalidFields.push(this.getFieldLabel(key));
      }
    });
    return invalidFields.join('\n');
  }

  protected submit(): void {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      this.openDialog('error', 'بيانات غير مكتملة', `يرجى تصحيح الحقول التالية:\n\n${this.getInvalidFieldsMessage()}`);
      return;
    }

    const raw = { ...this.form.value };

    const numericFields = [
      'landCode',
      'referenceNumber',
      'totalArea',
      'committeePricing',
      'purchasePrice',
      'lengthNorth',
      'lengthSouth',
      'lengthEast',
      'lengthWest',
      'lengthNe',
      'lengthNw',
      'lengthSe',
      'lengthSw'
    ];
    for (const field of numericFields) {
      const value = raw[field];
      if (value === '' || value === null || value === undefined) {
        raw[field] = null;
        continue;
      }

      const parsed = Number(value);
      if (Number.isNaN(parsed)) {
        this.openDialog('error', 'قيمة غير صحيحة', `القيمة المدخلة في الحقل: ${this.getFieldLabel(field)} غير صحيحة.`);
        return;
      }

      raw[field] = parsed;
    }

    const payload: any = {
      referenceNumber: raw.referenceNumber,
      usageStatus: raw.usageStatus,
      headquarters: raw.headquarters,
      approvalStatus: raw.approvalStatus,
      identificationNumber: raw.identificationNumber,
      centerDepartment: raw.centerDepartment,
      totalArea: raw.totalArea,
      phase: raw.phase,
      approval: raw.approval,
      housing: raw.housing,
      committeePricing: raw.committeePricing,
      purchasePrice: raw.purchasePrice,
      saleNegotiations: raw.saleNegotiations,
      landCode: raw.landCode,
      village: raw.village,
      currentOwner: raw.currentOwner,
      originalOwner: raw.originalOwner,
      model: raw.model,
      documents: raw.documents,
      plan: raw.plan,
      branchNotification: raw.branchNotification,
      realEstateStatus: raw.realEstateStatus,
      buildingBoundaries: raw.buildingBoundaries,
      networkData: raw.networkData,
      networkObservations: raw.networkObservations,
      landAreaFromTotal: raw.landAreaFromTotal,
      landUseDatabase: raw.landUseDatabase,
      landInspectionDatabase: raw.landInspectionDatabase,
      landConstructionObstacles: raw.landConstructionObstacles,
      landCreationObstacles: raw.landCreationObstacles,
      landConstructionData: raw.landConstructionData,
      landReceiptDatabase: raw.landReceiptDatabase,
      paidAmountsDatabase: raw.paidAmountsDatabase,
      decisionData: raw.decisionData,
      landCommittees: raw.landCommittees,
      landFacilities: raw.landFacilities,
      landCoordinatesData: raw.landCoordinatesData,
      educationalStudies: raw.educationalStudies,
      landReviewCommittees: raw.landReviewCommittees,

      north: raw.north,
      south: raw.south,
      east: raw.east,
      west: raw.west,
      lengthNorth: raw.lengthNorth,
      lengthSouth: raw.lengthSouth,
      lengthEast: raw.lengthEast,
      lengthWest: raw.lengthWest,
      ne: raw.ne,
      nw: raw.nw,
      se: raw.se,
      sw: raw.sw,
      lengthNe: raw.lengthNe,
      lengthNw: raw.lengthNw,
      lengthSe: raw.lengthSe,
      lengthSw: raw.lengthSw
    };

    this.landApiService.saveLand(payload).subscribe({
      next: () => {
        this.form.reset();
        this.openDialog('success', 'تم الحفظ', 'تم إضافة بيانات الأرض بنجاح!');
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(error, 'إضافة بيانات الأرض');
        this.openDialog('error', 'فشل الحفظ', `فشل في إضافة بيانات الأرض:\n${errorMessage}`);
      }
    });
  }
}
