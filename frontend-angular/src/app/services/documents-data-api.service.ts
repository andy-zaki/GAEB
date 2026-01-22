import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { environment } from '../../environments/environment.development';
import { ErrorHandlerService } from './error-handler.service';

export interface BuildingDocumentRowDto {
  documentId: number;
  name: string;
  exist: boolean;
  doesNotExist: boolean;
  notRequired: boolean;
}

export interface BuildingLookupDto {
  buildingNumber: string;
  schoolName: string | null;
}

export interface MasterDocumentDto {
  id: number;
  documentCode: string | null;
  name: string;
}

export interface SaveBuildingDocumentsRequest {
  buildingNumber: string;
  documents: Array<{
    documentId: number;
    exist: boolean;
    doesNotExist: boolean;
    notRequired: boolean;
  }>;
}

@Injectable({
  providedIn: 'root'
})
export class DocumentsDataApiService {
  private readonly http = inject(HttpClient);
  private readonly errorHandler = inject(ErrorHandlerService);
  private readonly baseUrl = `${environment.apiUrl}/api/DocumentsData`;

  getBuildingNumbers(): Observable<BuildingLookupDto[]> {
    return this.http.get<BuildingLookupDto[]>(`${this.baseUrl}/building-numbers`).pipe(
      tap(data => console.log(`Fetched ${data.length} building numbers`)),
      catchError(error => this.errorHandler.handleError(error, 'تحميل أرقام المباني'))
    );
  }

  getMasterDocuments(): Observable<MasterDocumentDto[]> {
    return this.http.get<MasterDocumentDto[]>(this.baseUrl).pipe(
      tap(data => console.log(`Fetched ${data.length} master documents`)),
      catchError(error => this.errorHandler.handleError(error, 'تحميل قائمة المستندات الأساسية'))
    );
  }

  createMasterDocument(payload: { name: string; documentCode?: string | null }): Observable<MasterDocumentDto> {
    return this.http.post<MasterDocumentDto>(this.baseUrl, payload).pipe(
      catchError(error => this.errorHandler.handleError(error, 'إضافة مستند جديد'))
    );
  }

  updateMasterDocument(id: number, payload: { name: string; documentCode?: string | null }): Observable<MasterDocumentDto> {
    return this.http.put<MasterDocumentDto>(`${this.baseUrl}/${id}`, payload).pipe(
      catchError(error => this.errorHandler.handleError(error, 'تعديل المستند'))
    );
  }

  deleteMasterDocument(id: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/${id}`).pipe(
      catchError(error => this.errorHandler.handleError(error, 'حذف المستند'))
    );
  }

  getDocumentsByBuildingNumber(buildingNumber: string): Observable<BuildingDocumentRowDto[]> {
    return this.http.get<BuildingDocumentRowDto[]>(`${this.baseUrl}/by-buildingnumber/${encodeURIComponent(buildingNumber)}`).pipe(
      tap(data => console.log(`Fetched ${data.length} documents for buildingNumber ${buildingNumber}`)),
      catchError(error => this.errorHandler.handleError(error, 'تحميل قائمة المستندات'))
    );
  }

  saveBuildingDocuments(payload: SaveBuildingDocumentsRequest): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}/save`, payload).pipe(
      catchError(error => this.errorHandler.handleError(error, 'حفظ بيانات المستندات للمبنى'))
    );
  }
}
