import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DestinosCartComponent } from './destinos-cart.component';

describe('DestinosCartComponent', () => {
  let component: DestinosCartComponent;
  let fixture: ComponentFixture<DestinosCartComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DestinosCartComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DestinosCartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
