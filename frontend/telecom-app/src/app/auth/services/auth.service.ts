import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs/operators';
import { BACKENDURL } from '../../utils/urls';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = `${BACKENDURL}/usuarios`;

  constructor(private http: HttpClient) {}

  login(email: string, clave: string) {
    return this.http.post<any>(`${this.apiUrl}/login`, { email, clave }).pipe(
      tap(response => {
        if (response && response.nombre && response.apellido) {
          const username = `${response.nombre} ${response.apellido}`;
          const id_usuario = `${response.id_usuario}`;
          localStorage.setItem('username', username);
          localStorage.setItem('id_usuario', id_usuario);
        }
      })
    );
  }

  logout() {
    localStorage.removeItem('username');
  }

  getUsername(): string | null {
    return localStorage.getItem('username');
  }
  getId(): string | null {
    return localStorage.getItem('id_usuario');
  }
}
