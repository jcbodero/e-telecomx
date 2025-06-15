import { TestBed, ComponentFixture, fakeAsync, tick } from '@angular/core/testing';
import { ValoresAPagarComponent } from './valores-a-pagar.component';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { AuthService } from '../../auth/services/auth.service';
import { DatePipe, CurrencyPipe } from '@angular/common';

describe('ValoresAPagarComponent', () => {
  let component: ValoresAPagarComponent;
  let fixture: ComponentFixture<ValoresAPagarComponent>;
  let httpMock: HttpTestingController;
  let authServiceStub: Partial<AuthService>;

  beforeEach(async () => {
    authServiceStub = {
      getId: () => '3'
    };

    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      declarations: [ValoresAPagarComponent],
      providers: [
        DatePipe,
        CurrencyPipe,
        { provide: AuthService, useValue: authServiceStub }
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(ValoresAPagarComponent);
    component = fixture.componentInstance;
    httpMock = TestBed.inject(HttpTestingController);
  });

  afterEach(() => {
    httpMock.verify(); // Verifica que no haya llamadas pendientes
  });

  it('debería crear el componente', () => {
    expect(component).toBeTruthy();
  });

  it('debería obtener facturas en ngOnInit', () => {
    fixture.detectChanges(); // dispara ngOnInit()

    const req = httpMock.expectOne('http://127.0.0.1:8080/api/facturas/usuario/3');
    expect(req.request.method).toBe('GET');

    const mockResponse = [
      {
          "estado_pago": "Pendiente",
          "fecha_emision": "Sat, 14 Jun 2025 00:00:00 GMT",
          "fecha_vencimiento": "Sun, 29 Jun 2025 00:00:00 GMT",
          "id_factura": 6,
          "id_usuario": 3,
          "nombre_usuario": "Juan Pérez",
          "total": "319.94"
      }
  ];
    req.flush(mockResponse);

    expect(component.nombreUsuario).toBe('Juan Pérez');
    expect(component.facturas.length).toBe(1);
  });

  it('debería alternar el detalle de una factura y obtener los detalles si no existen', fakeAsync(() => {
    const facturaId = 6;
    component.facturas = [{ id_factura: facturaId }];
    component.toggleDetalle(facturaId);

    const req = httpMock.expectOne(`http://127.0.0.1:8080/api/facturas/detalle/${facturaId}`);
    expect(req.request.method).toBe('GET');

    req.flush([{ descripcion: 'Paquete: Paquete Nube Pro - Servicio: Respaldos Automáticos', monto: "19.99" }]);
    tick();

    expect(component.detallesFactura[facturaId]).toEqual([{ descripcion: 'Paquete: Paquete Nube Pro - Servicio: Respaldos Automáticos', monto: "19.99" }]);
    expect(component.facturasAbiertas.has(facturaId)).toBeTrue();
  }));
});
