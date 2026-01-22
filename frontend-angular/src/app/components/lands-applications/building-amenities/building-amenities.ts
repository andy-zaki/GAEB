import { Component, inject, OnInit } from '@angular/core';
import { HeaderComponent } from '../../shared/header/header';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Amenity } from '../../../models/amenity.model';
import { BuildingApiService } from '../../../services/building-api.service';
import { AmenitiesApiService, AmenityDto } from '../../../services/amenities-api.service';
import { ErrorHandlerService } from '../../../services/error-handler.service';

@Component({
  selector: 'app-building-amenities',
  imports: [HeaderComponent, CommonModule, FormsModule],
  templateUrl: './building-amenities.html',
  styleUrl: './building-amenities.css'
})
export class BuildingAmenities implements OnInit {
  buildingNumber: string = '';
  hasSearched: boolean = false;
  isLoading = false;
  amenities: Amenity[] = [];
  availableAmenities: Array<AmenityDto & { selected: boolean }> = [];
  buildingsLookup: Array<{ id: string; buildingNumber: string; schoolName: string; display: string }> = [];

  newAmenityName = '';
  newAmenityDescription = '';

  private readonly buildingApiService = inject(BuildingApiService);
  private readonly amenitiesApiService = inject(AmenitiesApiService);
  private readonly errorHandler = inject(ErrorHandlerService);
  private buildingId: string | null = null;
  private buildingName: string | null = null;

  ngOnInit(): void {
    this.buildingApiService.getAllBuildings().subscribe({
      next: (items: any[]) => {
        const mapped = (items ?? []).map(b => {
          const buildingNumber = b?.buildingNumber ?? b?.BuildingNumber ?? '';
          const schoolName = b?.schoolName ?? b?.SchoolName ?? '';
          const id = b?.id ?? b?.Id ?? '';
          return {
            id,
            buildingNumber,
            schoolName,
            display: `${buildingNumber} - ${schoolName}`
          };
        });
        this.buildingsLookup = mapped.filter(x => !!x.buildingNumber);
      },
      error: () => {
        this.buildingsLookup = [];
      }
    });
  }

  searchAmenities() {
    const buildingNumber = (this.buildingNumber ?? '').trim();
    if (!buildingNumber) {
      this.hasSearched = false;
      this.amenities = [];
      this.buildingId = null;
      this.buildingName = null;
      return;
    }
    this.isLoading = true;
    this.hasSearched = true;
    this.amenities = [];
    this.buildingId = null;
    this.buildingName = null;

    const selected = this.buildingsLookup.find(x => x.buildingNumber === buildingNumber);
    if (selected?.id) {
      this.buildingId = selected.id;
      this.buildingName = selected.schoolName;

      this.amenitiesApiService.getAmenitiesByBuildingId(this.buildingId).subscribe({
        next: (items) => {
          this.amenities = (items ?? []).map((a: any) => ({
            id: a?.id ?? a?.Id,
            name: a?.name ?? a?.Name,
            description: a?.description ?? a?.Description,
            buildingName: this.buildingName ?? '',
            buildingNumber: buildingNumber
          }));
          this.isLoading = false;
        },
        error: (error) => {
          if (error?.status === 404) {
            this.amenities = [];
            this.isLoading = false;
            return;
          }

          const errorMessage = this.errorHandler.getUserFriendlyMessage(
            error,
            'تحميل مرافق المبنى'
          );
          alert(errorMessage);
          this.isLoading = false;
        }
      });

      return;
    }

    this.buildingApiService.getBuildingByNumber(buildingNumber).subscribe({
      next: (building: any) => {
        this.buildingId = building?.id ?? building?.Id ?? null;
        this.buildingName = building?.schoolName ?? building?.SchoolName ?? null;

        if (!this.buildingId) {
          this.isLoading = false;
          alert('تعذر تحديد معرف المبنى.');
          return;
        }

        this.amenitiesApiService.getAmenitiesByBuildingId(this.buildingId).subscribe({
          next: (items) => {
            this.amenities = (items ?? []).map((a: any) => ({
              id: a?.id ?? a?.Id,
              name: a?.name ?? a?.Name,
              description: a?.description ?? a?.Description,
              buildingName: this.buildingName ?? '',
              buildingNumber: buildingNumber
            }));
            this.isLoading = false;
          },
          error: (error) => {
            // NotFound (no amenities) should still show empty state
            if (error?.status === 404) {
              this.amenities = [];
              this.isLoading = false;
              return;
            }

            const errorMessage = this.errorHandler.getUserFriendlyMessage(
              error,
              'تحميل مرافق المبنى'
            );
            alert(errorMessage);
            this.isLoading = false;
          }
        });
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'البحث عن مبنى'
        );
        alert(errorMessage);
        this.isLoading = false;
      }
    });
  }

  createNewAmenity() {
    const name = (this.newAmenityName ?? '').trim();
    const description = (this.newAmenityDescription ?? '').trim();

    if (!name) {
      alert('يرجى إدخال اسم المرفق.');
      return;
    }

    this.isLoading = true;
    this.amenitiesApiService.createAmenity({ name, description }).subscribe({
      next: () => {
        this.newAmenityName = '';
        this.newAmenityDescription = '';

        this.amenitiesApiService.getAllAmenities().subscribe({
          next: (items) => {
            this.availableAmenities = (items ?? []).map(a => ({
              ...a,
              selected: false
            }));
            this.isLoading = false;
          },
          error: (error) => {
            const errorMessage = this.errorHandler.getUserFriendlyMessage(
              error,
              'تحميل المرافق'
            );
            alert(errorMessage);
            this.isLoading = false;
          }
        });
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'إنشاء مرفق جديد'
        );
        alert(errorMessage);
        this.isLoading = false;
      }
    });
  }

  deleteAmenity(amenity: Amenity) {
    if (!this.buildingId) {
      alert('تعذر تحديد معرف المبنى.');
      return;
    }

    this.isLoading = true;
    this.amenitiesApiService.deleteBuildingAmenity(this.buildingId, amenity.id).subscribe({
      next: () => {
        this.amenities = this.amenities.filter(a => a.id !== amenity.id);
        this.isLoading = false;
      },
      error: (error) => {
        const errorMessage = this.errorHandler.getUserFriendlyMessage(
          error,
          'حذف مرفق من المبنى'
        );
        alert(errorMessage);
        this.isLoading = false;
      }
    });
  }
  constructor() {}

  private router = inject(Router);

  isModalOpen = false;


openAddModal() {
  if (!this.buildingId) {
    alert('يرجى إدخال رقم مبنى صحيح والبحث أولاً.');
    return;
  }

  this.isModalOpen = true;

  this.newAmenityName = '';
  this.newAmenityDescription = '';

  if (this.availableAmenities.length > 0) {
    return;
  }

  this.isLoading = true;
  this.amenitiesApiService.getAllAmenities().subscribe({
    next: (items) => {
      this.availableAmenities = (items ?? []).map(a => ({
        ...a,
        selected: false
      }));
      this.isLoading = false;
    },
    error: (error) => {
      const errorMessage = this.errorHandler.getUserFriendlyMessage(
        error,
        'تحميل المرافق'
      );
      alert(errorMessage);
      this.availableAmenities = [];
      this.isLoading = false;
    }
  });
}

closeModal() {
  this.isModalOpen = false;
  // إلغاء التحديد عند الإغلاق
  this.availableAmenities.forEach(a => a.selected = false);
}

onAmenitySelect(item: any) {
  // يمكنك إضافة منطق هنا
}

hasSelectedAmenities(): boolean {
  return this.availableAmenities.some(a => a.selected);
}

confirmAddAmenities() {
  if (!this.buildingId) {
    alert('تعذر تحديد المبنى.');
    return;
  }

  const selected = this.availableAmenities.filter(a => a.selected);
  if (selected.length === 0) {
    return;
  }

  this.isLoading = true;
  this.amenitiesApiService.createBuildingAmenity({
    buildingId: this.buildingId,
    amenityIds: selected.map(s => s.id)
  }).subscribe({
    next: (res) => {
      this.closeModal();
      alert(`تم إضافة ${res?.createdCount ?? selected.length} مرفق بنجاح!`);
      this.searchAmenities();
      this.isLoading = false;
    },
    error: (error) => {
      const errorMessage = this.errorHandler.getUserFriendlyMessage(
        error,
        'إضافة مرافق للمبنى'
      );
      alert(errorMessage);
      this.isLoading = false;
    }
  });
}

  protected goBack(): void {
    this.router.navigate(['/lands-main-menu']);
  }

  protected goHome(): void {
    this.router.navigate(['/dashboard']);
  }

  protected logout(): void {
    this.router.navigate(['/login']);
  }

  addAmenity() {
    // You can open a modal or navigate to a form page
    console.log("Add Amenity Clicked");
  }
}
