import { Component, inject } from '@angular/core';
import { FormGroup, FormBuilder, Validators, ReactiveFormsModule, AbstractControl } from '@angular/forms';
import { HeaderComponent } from '../../shared/header/header';
import { Router } from '@angular/router';
import { LookupApiService } from '../../../services/lookup-api.service';
import { BuildingApiService } from '../../../services/building-api.service';
import { DistrictData, VillageData, LandOwnerData } from '../../../models/Lookup.Model';
import { ErrorHandlerService } from '../../../services/error-handler.service';
import { SchoolMapApiService } from '../../../services/school-map-api.service';

@Component({
  selector: 'app-main-data-for-school-insertion',
  imports: [ReactiveFormsModule, HeaderComponent],
  templateUrl: './main-data-for-school-insertion.html',
  styleUrl: './main-data-for-school-insertion.css'
})

export class MainDataForSchoolInsertion {
  private router = inject(Router);
  private lookupApiService = inject(LookupApiService);
  private errorHandler = inject(ErrorHandlerService);
  private buildingApiService = inject(BuildingApiService);
  private schoolMapService = inject(SchoolMapApiService);

  protected goBack(): void {
    this.router.navigate(['/lands-main-menu']);
  }

  protected goHome(): void {
    this.router.navigate(['/dashboard']);
  }

  protected logout(): void {
    this.router.navigate(['/login']);
  }
  landForm!: FormGroup;

  //Lookup
  districts: DistrictData[] = []; // Declare an empty array of MyObject
  villages: VillageData[] = [];
  landOwners: LandOwnerData[] = [];

  getControl(name: string): AbstractControl | null {
    return this.landForm?.get(name) ?? null;
  }

  getControlErrorMessage(name: string): string | null {
    const control = this.getControl(name);
    if (!control || !control.errors || !control.touched) {
      return null;
    }

    if (control.errors['server']) {
      return control.errors['server'];
    }

    if (control.errors['required']) {
      const requiredMessages: Record<string, string> = {
        buildingNumber: 'رقم قطعة الأرض مطلوب.',
        buildingName: 'مسمى قطعة الأرض مطلوب.',
        totalArea: 'المساحة الكلية مطلوبة.',
        districtId: 'المركز / القسم مطلوب.',
        villageId: 'القرية / الحي مطلوب.',
        landOwnership: 'مالك الأرض مطلوب.'
      };
      return requiredMessages[name] ?? 'هذا الحقل مطلوب.';
    }

    if (control.errors['min']) {
      if (name === 'totalArea') {
        return 'المساحة الكلية يجب أن تكون أكبر من صفر.';
      }
      return 'القيمة غير صالحة.';
    }

    return 'القيمة غير صالحة.';
  }

  constructor(private fb: FormBuilder) {

    this.loadDistricts();
    this.loadLandOwners();

    this.landForm = this.fb.group({
      buildingNumber: ['', Validators.required],
      buildingName: ['', Validators.required],
      districtId: ['', Validators.required],
      villageId: ['', Validators.required],
      subVillage: [''],
      totalArea: ['', [Validators.required, Validators.min(1)]],
      landOwnership: ['', Validators.required],
    });

    this.landForm.get('districtId')?.valueChanges.subscribe((value) => {
      const districtNumber = Number(value);

      this.villages = [];
      this.landForm.get('villageId')?.setValue('');

      if (!districtNumber) {
        return;
      }

      this.getVillagesByDistrictNumber(districtNumber);
    });
  }

  onDistrictChange(event: Event) {
    const value = (event.target as HTMLSelectElement | null)?.value;
    const districtNumber = Number(value);
    console.log('District changed (raw value):', value, 'parsed:', districtNumber);

    this.landForm.get('districtId')?.setValue(value, { emitEvent: false });

    if (!districtNumber) {
      this.villages = [];
      this.landForm.get('villageId')?.setValue('');
      return;
    }
    this.getVillagesByDistrictNumber(districtNumber);
  }

  private loadLandOwners() {
    this.lookupApiService.getLandOwners().subscribe({
      next: (landOwnersList) => {
        if (!landOwnersList) {
          this.landOwners = [];
          return;
        }
        this.landOwners = Array.isArray(landOwnersList) ? landOwnersList : [landOwnersList];
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'تحميل المحافظات'
        );
        alert(errorMessage);
      }
    });
  }

  getVillagesByDistrictNumber(districtNumber: number) {
    console.log('Loading villages for district:', districtNumber);
    this.lookupApiService.GetVillagesByDistrictNumber(districtNumber).subscribe({
      next: (villagesList) => {
        // Guard against null and normalize the response to an array
        if (!villagesList) {
          this.villages = [];
          return;
        }

        const raw = Array.isArray(villagesList) ? villagesList : [villagesList];
        this.villages = raw
          .map((v: any) => ({
            number: v?.number ?? v?.Number,
            name: v?.name ?? v?.Name,
            districtNumber: v?.districtNumber ?? v?.DistrictNumber
          }))
          .filter(v => v.number != null && v.name != null);
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'تحميل المحافظات'
        );
        alert(errorMessage);
      }
    });
  }

  loadDistricts() {
    this.lookupApiService.getDistricts().subscribe({
      next: (districtsList) => {
        // Guard against null and normalize the response to an array
        if (!districtsList) {
          this.districts = [];
          return;
        }
        const raw = Array.isArray(districtsList) ? districtsList : [districtsList];
        this.districts = raw
          .map((d: any) => ({
            number: d?.number ?? d?.Number,
            name: d?.name ?? d?.Name
          }))
          .filter(d => d.number != null && d.name != null);

        console.log('Districts loaded (sample):', this.districts.slice(0, 5));
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'تحميل المحافظات'
        );
        alert(errorMessage);
      }
    });
  }

  submit() {
    this.clearServerErrors();

    if (this.landForm.invalid) {
      this.landForm.markAllAsTouched();
      return;
    }

    this.schoolMapService.createEducationalBuildingWithBuilding(this.landForm.value).subscribe({
      next: () => {

        // Send form data to backend -- currently logging and clearing form
        console.log('Land inspection data submitted', this.landForm.value);
        alert('✅ تم حفظ البيانات الأساسية لقطعة الأرض بنجاح!');
        this.landForm.reset();
        this.goHome();
      },
      error: (error) => {
        console.error('Error creating building:', error);

        this.applyServerValidationErrors(error);

        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'إضافة المبنى'
        );
        alert(`❌ فشل في حفظ البيانات الأساسية لقطعة الأرض بنجاح:\n${errorMessage}`);
      }
    });

    console.log('Form Data:', this.landForm.value);
  }

  private clearServerErrors() {
    if (!this.landForm) {
      return;
    }

    Object.keys(this.landForm.controls).forEach((key) => {
      const control = this.landForm.get(key);
      if (!control || !control.errors || !control.errors['server']) {
        return;
      }

      const { server, ...rest } = control.errors;
      const newErrors = Object.keys(rest).length > 0 ? rest : null;
      control.setErrors(newErrors);
    });
  }

  private applyServerValidationErrors(error: any) {
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

      const formControls = Object.keys(this.landForm.controls);
      const matchedControlName = formControls.find(c => candidateNames.some(k => k === c || k.toLowerCase() === c.toLowerCase()));

      const targetControlName = matchedControlName
        ?? (normalizedKey.length === 0 ? 'villageId' : null);

      if (!targetControlName) {
        return;
      }

      const control = this.landForm.get(targetControlName);
      if (!control) {
        return;
      }

      control.setErrors({ ...(control.errors ?? {}), server: message });
      control.markAsTouched();
    });
  }
}
