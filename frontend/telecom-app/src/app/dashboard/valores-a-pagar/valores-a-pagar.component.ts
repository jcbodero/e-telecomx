import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../auth/services/auth.service';
import { NgForOf, NgIf, DatePipe, CurrencyPipe } from '@angular/common';
import { BACKENDURL } from '../../utils/urls';

@Component({
  selector: 'app-valores-a-pagar',
  standalone: true,
  imports: [NgForOf, NgIf, DatePipe, CurrencyPipe],
  templateUrl: './valores-a-pagar.component.html',
  styleUrls: ['./valores-a-pagar.component.css'],  
})
export class ValoresAPagarComponent implements OnInit {
  nombreUsuario = '';
  facturas: any[] = [];
  facturasAbiertas = new Set<number>();
  detallesFactura: { [idFactura: number]: any[] } = {};

  constructor(private http: HttpClient, private authService: AuthService) {}

  ngOnInit(): void {
    const userId = this.authService.getId();
    this.http.get<any[]>(`${BACKENDURL}/facturas/usuario/${userId}`)
      .subscribe(response => {
        if (response.length > 0) {
          this.nombreUsuario = response[0].nombre_usuario;
          this.facturas = response;
        }
      });
  }
  toggleDetalle(idFactura: number): void {
    if (this.facturasAbiertas.has(idFactura)) {
      this.facturasAbiertas.delete(idFactura);
    } else {
      this.facturasAbiertas.add(idFactura);

      if (!this.detallesFactura[idFactura]) {
        this.http.get<any[]>(`http://127.0.0.1:8080/api/facturas/detalle/${idFactura}`)
          .subscribe(detalles => {
            this.detallesFactura[idFactura] = detalles;
          });
      }
    }
  }
}
