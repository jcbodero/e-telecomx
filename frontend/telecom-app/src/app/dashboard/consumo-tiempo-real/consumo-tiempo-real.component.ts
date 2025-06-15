import { Component, OnInit, OnDestroy } from '@angular/core';
import { NgForOf, NgIf } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../auth/services/auth.service';
import { BACKENDURL } from '../../utils/urls';

type Servicio = {
  id_servicio: number;
  nombre_servicio: string;
  precio_paquete: number;
  consumo_mb: number;
};

type Paquete = {
  id_paquete: number;
  nombre_paquete: string;
  servicios: Servicio[];
  total_a_pagar: number;
};

@Component({
  selector: 'app-consumo-tiempo-real',
  standalone: true,
  imports: [NgForOf, NgIf],
  templateUrl: './consumo-tiempo-real.component.html',
})
export class ConsumoTiempoRealComponent implements OnInit, OnDestroy {
  nombreCompleto = '';
  paquetes: Paquete[] = [];
  intervalId: any;

  constructor(private http: HttpClient, private authService: AuthService) {}

  ngOnInit(): void {
    const userId = this.authService.getId();

    const fetchData = () => {
      this.http.get<any[]>(`${BACKENDURL}/usuarios/paquetes/${userId}`)
        .subscribe(response => {
          if (response.length > 0) {
            this.nombreCompleto = response[0].nombre_completo;

            const paquetesMap = new Map<number, Paquete>();

            for (const item of response) {
              let paquete = paquetesMap.get(item.id_paquete);
              if (!paquete) {
                paquete = {
                  id_paquete: item.id_paquete,
                  nombre_paquete: item.nombre_paquete,
                  servicios: [],
                  total_a_pagar: 0,
                };
                paquetesMap.set(item.id_paquete, paquete);
              }

              const servicio: Servicio = {
                id_servicio: item.id_servicio,
                nombre_servicio: item.nombre_servicio,
                precio_paquete: parseFloat(item.precio_paquete),
                consumo_mb: parseFloat(item.consumo_mb),
              };

              paquete.servicios.push(servicio);
              paquete.total_a_pagar += servicio.precio_paquete;
            }

            this.paquetes = Array.from(paquetesMap.values());
          }
        });
    };

    // Llamada inicial
    fetchData();

    // Repetir cada 2 segundos
    this.intervalId = setInterval(fetchData, 4000);
  }

  ngOnDestroy(): void {
    clearInterval(this.intervalId);
  }
}
