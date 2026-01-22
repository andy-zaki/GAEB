import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { environment } from '../../environments/environment.development';
import { ErrorHandlerService } from './error-handler.service';

export interface AmenityDto {
  id: string;
  name: string;
  description: string;
}

export interface CreateBuildingAmenityRequest {
  buildingId: string;
  amenityIds: string[];
}

export interface CreateBuildingAmenityResponse {
  buildingId: string;
  createdCount: number;
  skippedCount: number;
  createdAmenityIds: string[];
  skippedAmenityIds: string[];
}

export interface CreateAmenityRequest {
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class AmenitiesApiService {
  private readonly http = inject(HttpClient);
  private readonly errorHandler = inject(ErrorHandlerService);
  private readonly baseUrl = `${environment.apiUrl}/api/amenities`;

  getAllAmenities(): Observable<AmenityDto[]> {
    return this.http.get<AmenityDto[]>(this.baseUrl).pipe(
      tap(data => console.log(`Fetched ${data.length} amenities`)),
      catchError(error => this.errorHandler.handleError(error, 'تحميل المرافق'))
    );
  }

  getAmenitiesByBuildingId(buildingId: string): Observable<AmenityDto[]> {
    return this.http.get<AmenityDto[]>(`${this.baseUrl}/by-building/${buildingId}`).pipe(
      tap(data => console.log(`Fetched ${data.length} amenities for building ${buildingId}`)),
      catchError(error => this.errorHandler.handleError(error, 'تحميل مرافق المبنى'))
    );
  }

  createBuildingAmenity(payload: CreateBuildingAmenityRequest): Observable<CreateBuildingAmenityResponse> {
    return this.http.post<CreateBuildingAmenityResponse>(`${this.baseUrl}/create-building-amenity`, payload).pipe(
      tap(data => console.log('Created building amenities:', data)),
      catchError(error => this.errorHandler.handleError(error, 'إضافة مرافق للمبنى'))
    );
  }

  deleteBuildingAmenity(buildingId: string, amenityId: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/by-building/${buildingId}/${amenityId}`).pipe(
      tap(() => console.log(`Deleted amenity ${amenityId} from building ${buildingId}`)),
      catchError(error => this.errorHandler.handleError(error, 'حذف مرفق من المبنى'))
    );
  }

  createAmenity(payload: CreateAmenityRequest): Observable<AmenityDto> {
    return this.http.post<AmenityDto>(`${this.baseUrl}`, payload).pipe(
      tap(data => console.log('Created amenity:', data)),
      catchError(error => this.errorHandler.handleError(error, 'إنشاء مرفق جديد'))
    );
  }
}
