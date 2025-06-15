import { Component, OnInit } from '@angular/core';
import { NgForOf, NgIf } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../auth/services/auth.service';
import { BACKENDURL } from '../../utils/urls';

@Component({
  selector: 'app-servicios-contratados',
  standalone: true,
  imports: [NgForOf, NgIf],
  templateUrl: './servicios-contratados.component.html',
})
export class ServiciosContratadosComponent implements OnInit {
  nombreCompleto = '';
  servicios: { id_servicio: number, nombre_servicio: string }[] = [];

  constructor(private http: HttpClient,private authService: AuthService) {}

  ngOnInit(): void {
    const userId = this.authService.getId();
    this.http.get<any>(`${BACKENDURL}/usuarios/servicios/${userId}`)
      .subscribe(response => {
        this.nombreCompleto = response.nombre_completo;
        this.servicios = JSON.parse(response.servicios_json);
      });
  }
}
