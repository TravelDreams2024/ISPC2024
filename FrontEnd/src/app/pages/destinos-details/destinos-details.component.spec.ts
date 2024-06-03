import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DestinosDetailsComponent } from './destinos-details.component';

describe('DestinosDetailsComponent', () => {
  let component: DestinosDetailsComponent;
  let fixture: ComponentFixture<DestinosDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DestinosDetailsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DestinosDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
