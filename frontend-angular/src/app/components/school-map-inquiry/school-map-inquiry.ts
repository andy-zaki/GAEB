import { Component, inject, signal } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { HeaderComponent } from '../shared/header/header';
import { Building } from '../../models/building.model';
import { BuildingApiService } from '../../services/building-api.service';
import { ErrorHandlerService } from '../../services/error-handler.service';

interface MapOption {
  id: number;
  title: string;
  icon: string;
  description: string;
  route: string;
}

@Component({
  selector: 'app-school-map-inquiry',
  templateUrl: './school-map-inquiry.html',
  styleUrl: './school-map-inquiry.css',
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent]
})
export class SchoolMapInquiryComponent {
  private router = inject(Router);
  private fb = inject(FormBuilder);
  private buildingDatabaseService = inject(BuildingApiService);
  private errorHandler = inject(ErrorHandlerService);

  inquiryForm!: FormGroup;
  showModal = signal<boolean>(false);
  searchResults = signal<Building[]>([]);

  mapOptions: MapOption[] = [
    {
      id: 1,
      title: 'بيانات الفترة الدراسية',
      icon: '📅',
      description: 'معلومات الفترات الدراسية',
      route: '/school-map-study-period'
    },
    {
      id: 2,
      title: 'بيانات الطرق المحيطة',
      icon: '🛣️',
      description: 'الطرق المحيطة بالمدرسة',
      route: '/school-map-roads'
    },
    {
      id: 3,
      title: 'بيانات الملاحق',
      icon: '🏗️',
      description: 'معلومات الملاحق والإضافات',
      route: '/school-map-annexes'
    },
    {
      id: 4,
      title: 'تسجيل بيانات الفراغات',
      icon: '📋',
      description: 'تسجيل الفراغات في المبنى',
      route: '/school-map-spaces'
    }
  ];

  constructor() {
    this.inquiryForm = this.fb.group({
      governorate: ['', Validators.required],
      regionalCenter: ['', Validators.required],
      educationalAdministration: ['', Validators.required],
      district: ['', Validators.required],
      neighborhood: ['', Validators.required],
      villageAffiliate: [''],
      
      // Characteristics
      stage: ['', Validators.required],
      affiliation: ['', Validators.required],
      educationType: ['', Validators.required],
      studentType: ['', Validators.required],
      landOwnership: ['', Validators.required],
      buildingOwnership: ['', Validators.required],
      usageStatus: ['', Validators.required],
      schoolName: ['', Validators.required],
      buildingNumber: ['', Validators.required]
    });
  }

  onSearch() {
    if (this.inquiryForm.valid) {
      console.log('Search Data:', this.inquiryForm.value);
      const criteria: Partial<Building> = this.inquiryForm.value;
      // Use mock database service to search buildings
      this.buildingDatabaseService.searchBuildings(criteria).subscribe({
        next: (results) => {
          this.searchResults.set(results);
          this.showModal.set(true);
        },
        error: (error) => {
          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            error,
            'البحث عن المباني'
          );
          alert(errorMessage);
        }
      });
    } else {
      this.markFormGroupTouched(this.inquiryForm);
    }
  }

  closeModal() {
    this.showModal.set(false);
  }

  onReset() {
    this.inquiryForm.reset();
  }

  private markFormGroupTouched(formGroup: FormGroup) {
    Object.keys(formGroup.controls).forEach(key => {
      const control = formGroup.get(key);
      control?.markAsTouched();
    });
  }

  navigateToOption(route: string) {
    this.router.navigate([route]);
  }

  navigateBack() {
    this.router.navigate(['/educational-building']);
  }

  goHome() {
    this.router.navigate(['/dashboard']);
  }

  logout() {
    this.router.navigate(['/login']);
  }
}
