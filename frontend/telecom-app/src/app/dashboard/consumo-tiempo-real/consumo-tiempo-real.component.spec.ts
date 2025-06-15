import { TestBed, ComponentFixture, fakeAsync, tick } from '@angular/core/testing';
import { ConsumoTiempoRealComponent } from './consumo-tiempo-real.component';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { AuthService } from '../../auth/services/auth.service';
import { BACKENDURL } from '../../utils/urls';
import { NgForOf, NgIf } from '@angular/common';

describe('ConsumoTiempoRealComponent', () => {
  let component: ConsumoTiempoRealComponent;
  let fixture: ComponentFixture<ConsumoTiempoRealComponent>;
  let httpMock: HttpTestingController;

  const mockUserId = 3;
  const mockAuthService = {
    getId: () => mockUserId
  };

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HttpClientTestingModule, NgForOf, NgIf],
      declarations: [ConsumoTiempoRealComponent],
      providers: [{ provide: AuthService, useValue: mockAuthService }]
    }).compileComponents();

    fixture = TestBed.createComponent(ConsumoTiempoRealComponent);
    component = fixture.componentInstance;
    httpMock = TestBed.inject(HttpTestingController);
  });

  afterEach(() => {
    httpMock.verify(); // Asegura que no hay peticiones pendientes
    if (component.intervalId) {
      clearInterval(component.intervalId); // Por si acaso no entró a ngOnDestroy
    }
  });

  it('debería crear el componente', () => {
    expect(component).toBeTruthy();
  });

  it('debería cargar datos en ngOnInit y agrupar por paquete', fakeAsync(() => {
    fixture.detectChanges(); // llama ngOnInit()

    const mockResponse = [
      {
          "consumo_mb": "72980.37",
          "id_paquete": 42,
          "id_servicio": 4,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Paquete Premium Hogar",
          "nombre_servicio": "TV HD Premium",
          "precio_paquete": "49.99"
      },
      {
          "consumo_mb": "9819.99",
          "id_paquete": 45,
          "id_servicio": 4,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Paquete Familiar",
          "nombre_servicio": "TV HD Premium",
          "precio_paquete": "39.99"
      },
      {
          "consumo_mb": "69589.32",
          "id_paquete": 46,
          "id_servicio": 13,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Paquete Nube Pro",
          "nombre_servicio": "Respaldos Automáticos",
          "precio_paquete": "19.99"
      },
      {
          "consumo_mb": "4764.05",
          "id_paquete": 50,
          "id_servicio": 4,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Paquete Streaming",
          "nombre_servicio": "TV HD Premium",
          "precio_paquete": "44.99"
      },
      {
          "consumo_mb": "79591.55",
          "id_paquete": 51,
          "id_servicio": 7,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Plan Emprendedor",
          "nombre_servicio": "Correo Corporativo",
          "precio_paquete": "34.99"
      },
      {
          "consumo_mb": "6388.96",
          "id_paquete": 53,
          "id_servicio": 13,
          "id_usuario": 3,
          "nombre_completo": "Juan Pérez",
          "nombre_paquete": "Plan Data Center",
          "nombre_servicio": "Respaldos Automáticos",
          "precio_paquete": "129.99"
      }
  ]

    const req = httpMock.expectOne(`${BACKENDURL}/usuarios/paquetes/${mockUserId}`);
    expect(req.request.method).toBe('GET');
    req.flush(mockResponse);

    tick(0); // Avanza el tiempo para ejecutar el callback del observable

    expect(component.nombreCompleto).toBe('Juan Pérez');
    expect(component.paquetes.length).toBe(6);
    
  }));

  it('debería limpiar el intervalo en ngOnDestroy', () => {
    spyOn(window, 'clearInterval');
    component.intervalId = 12345;
    component.ngOnDestroy();
    expect(clearInterval).toHaveBeenCalledWith(12345);
  });
});
