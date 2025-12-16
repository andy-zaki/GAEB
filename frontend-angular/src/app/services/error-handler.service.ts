import { Injectable, inject } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';

/**
 * Enhanced Error Information Interface
 */
export interface ErrorDetails {
  message: string;
  status?: number;
  statusText?: string;
  error?: any;
  context?: string;
  suggestion?: string;
  technicalDetails?: string;
}

/**
 * Error Handler Service
 * Centralized error handling for HTTP requests with detailed context
 */
@Injectable({
  providedIn: 'root'
})
export class ErrorHandlerService {
  /**
   * Handle HTTP errors and return detailed user-friendly messages
   * @param error The HTTP error response
   * @param context Optional context about what operation was being performed
   */
  handleError(error: HttpErrorResponse, context?: string): Observable<never> {
    const errorDetails = this.buildErrorDetails(error, context);

    // Log full error for debugging
    console.error('Error Details:', errorDetails);
    console.error('Full error object:', error);

    return throwError(() => errorDetails);
  }

  /**
   * Build detailed error information based on HTTP error
   */
  private buildErrorDetails(error: HttpErrorResponse, context?: string): ErrorDetails {
    let message = 'حدث خطأ غير متوقع';
    let suggestion = 'الرجاء المحاولة مرة أخرى';
    let technicalDetails = '';

    if (error.error instanceof ErrorEvent) {
      // Client-side or network error
      message = 'فشل الاتصال بالخادم';
      suggestion = 'تحقق من اتصال الإنترنت وحاول مرة أخرى';
      technicalDetails = `خطأ في الشبكة: ${error.error.message}`;
      console.error('Client-side error:', error.error.message);
    } else {
      // Backend returned an unsuccessful response code
      const errorInfo = this.getErrorInfoByStatus(error.status, error);
      message = errorInfo.message;
      suggestion = errorInfo.suggestion;
      technicalDetails = errorInfo.technicalDetails;
    }

    // Add context to message if provided
    if (context) {
      message = `خطأ في ${context}: ${message}`;
    }

    return {
      message,
      status: error.status,
      statusText: error.statusText,
      error: error.error,
      context,
      suggestion,
      technicalDetails
    };
  }

  /**
   * Get detailed error information based on HTTP status code
   */
  private getErrorInfoByStatus(status: number, error: HttpErrorResponse): {
    message: string;
    suggestion: string;
    technicalDetails: string;
  } {
    switch (status) {
      case 0:
        console.error('Cannot connect to server. Backend may be down.');
        return {
          message: 'تعذر الاتصال بالخادم',
          suggestion: 'تأكد من أن الخادم يعمل على http://localhost:5001 ثم حاول مرة أخرى',
          technicalDetails: 'لا يوجد استجابة من الخادم (Status 0 - خادم متوقف أو مشكلة في CORS)'
        };

      case 400:
        console.error('Bad Request (400):', error.error);
        const serverError = error.error?.errors || error.error?.message || '';
        return {
          message: 'البيانات المدخلة غير صحيحة',
          suggestion: 'تحقق من صحة البيانات المدخلة وتأكد من ملء جميع الحقول المطلوبة',
          technicalDetails: `طلب غير صحيح (400): ${serverError}`
        };

      case 401:
        console.error('Unauthorized (401)');
        return {
          message: 'انتهت صلاحية الجلسة',
          suggestion: 'يرجى تسجيل الدخول مرة أخرى للمتابعة',
          technicalDetails: 'غير مصرح (401) - يتطلب مصادقة'
        };

      case 403:
        console.error('Forbidden (403)');
        return {
          message: 'ليس لديك صلاحية لهذه العملية',
          suggestion: 'اتصل بمسؤول النظام للحصول على الصلاحيات المطلوبة',
          technicalDetails: 'ممنوع (403) - لا توجد صلاحيات كافية'
        };

      case 404:
        console.error('Not Found (404):', error.url);
        return {
          message: 'البيانات المطلوبة غير موجودة',
          suggestion: 'تحقق من صحة الرقم المرجعي أو المعرف المدخل',
          technicalDetails: `غير موجود (404): ${error.url}`
        };

      case 409:
        console.error('Conflict (409):', error.error);
        return {
          message: 'تعارض في البيانات',
          suggestion: 'البيانات موجودة مسبقاً أو يوجد تعارض مع بيانات أخرى',
          technicalDetails: `تعارض (409): ${JSON.stringify(error.error)}`
        };

      case 422:
        console.error('Unprocessable Entity (422):', error.error);
        const validationErrors = error.error?.errors || {};
        const errorMessages = Object.values(validationErrors).flat().join(', ');
        return {
          message: 'فشل التحقق من البيانات',
          suggestion: `الأخطاء: ${errorMessages || 'بيانات غير صالحة'}`,
          technicalDetails: `كيان غير قابل للمعالجة (422): ${JSON.stringify(validationErrors)}`
        };

      case 500:
        console.error('Internal Server Error (500):', error.error);
        return {
          message: 'خطأ داخلي في الخادم',
          suggestion: 'حدثت مشكلة في الخادم، الرجاء المحاولة لاحقاً أو الاتصال بالدعم الفني',
          technicalDetails: `خطأ خادم داخلي (500): ${error.error?.message || error.message}`
        };

      case 503:
        console.error('Service Unavailable (503)');
        return {
          message: 'الخدمة غير متوفرة مؤقتاً',
          suggestion: 'الخادم مشغول أو تحت الصيانة، الرجاء المحاولة بعد قليل',
          technicalDetails: 'خدمة غير متاحة (503)'
        };

      case 504:
        console.error('Gateway Timeout (504)');
        return {
          message: 'انتهت مهلة الاتصال',
          suggestion: 'استغرق الطلب وقتاً طويلاً، الرجاء المحاولة مرة أخرى',
          technicalDetails: 'انتهاء مهلة البوابة (504)'
        };

      default:
        console.error(`Server Error (${status}):`, error.error);
        return {
          message: `خطأ من الخادم (${status})`,
          suggestion: 'حدث خطأ غير متوقع، الرجاء المحاولة لاحقاً',
          technicalDetails: `${status} - ${error.statusText}: ${error.error?.message || error.message}`
        };
    }
  }

  /**
   * Validate that required data exists
   */
  validateData<T>(data: T | null | undefined, dataName: string): T {
    if (data === null || data === undefined) {
      const errorMessage = `البيانات المطلوبة غير موجودة: ${dataName}`;
      console.error(errorMessage);
      throw new Error(errorMessage);
    }
    return data;
  }

  /**
   * Validate array data is not empty
   */
  validateArrayData<T>(data: T[] | null | undefined, dataName: string): T[] {
    if (!data || data.length === 0) {
      const errorMessage = `لا توجد بيانات: ${dataName}`;
      console.warn(errorMessage);
      return [];
    }
    return data;
  }

  /**
   * Validate string data is not empty
   */
  validateString(value: string | null | undefined, fieldName: string): string {
    if (!value || value.trim() === '') {
      const errorMessage = `الحقل المطلوب فارغ: ${fieldName}`;
      console.error(errorMessage);
      throw new Error(errorMessage);
    }
    return value;
  }

  /**
   * Validate GUID format
   */
  validateGuid(guid: string | null | undefined, fieldName: string): string {
    if (!guid) {
      throw new Error(`معرف فارغ: ${fieldName}`);
    }

    const guidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
    if (!guidRegex.test(guid)) {
      throw new Error(`معرف غير صحيح: ${fieldName}`);
    }

    return guid;
  }

  /**
   * Format error for display with full details
   */
  formatErrorMessage(error: any): string {
    if (error && typeof error === 'object') {
      const details = error as ErrorDetails;
      let formatted = details.message;

      if (details.suggestion) {
        formatted += `\n\nالحل المقترح: ${details.suggestion}`;
      }

      if (details.technicalDetails && console) {
        console.error('Technical Details:', details.technicalDetails);
      }

      return formatted;
    }

    return error?.message || error?.error?.message || 'حدث خطأ غير متوقع';
  }

  /**
   * Get a user-friendly error message with suggestions
   */
  getUserFriendlyMessage(error: any, operation?: string): string {
    let message = '';

    if (operation) {
      message = `خطأ أثناء ${operation}\n`;
    }

    if (error && typeof error === 'object' && 'message' in error) {
      const details = error as ErrorDetails;

      if (typeof (details.error) == 'object')
        message += details.message;
      else
        message += `\n${details.error}`;

      if (details.suggestion) {
        message += `\n\n💡 ${details.suggestion}`;
      }
    } else {
      message += error?.message || 'حدث خطأ غير متوقع';
      message += '\n\n💡 الرجاء المحاولة مرة أخرى أو الاتصال بالدعم الفني';
    }

    return message;
  }

  /**
   * Log and display error to user with detailed information
   */
  logAndShowError(error: any, context: string): void {
    console.error(`Error in ${context}:`, error);

    const message = this.getUserFriendlyMessage(error, context);
    alert(message);
  }
}
