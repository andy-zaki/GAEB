import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SchoolBordersDataInsertionComponent } from './school-borders-data-insertion';

describe('SchoolBordersDataInsertionComponent', () => {
  let component: SchoolBordersDataInsertionComponent;
  let fixture: ComponentFixture<SchoolBordersDataInsertionComponent>;
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SchoolBordersDataInsertionComponent] 
    })
    .compileComponents();

    fixture = TestBed.createComponent(SchoolBordersDataInsertionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
