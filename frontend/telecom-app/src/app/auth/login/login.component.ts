import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../services/auth.service';

@Component({
  standalone: true,
  selector: 'app-login',
  templateUrl: './login.component.html',
  imports: [FormsModule], 
  styleUrls: ['./login.component.css'],  
})
export class LoginComponent {
  username = '';
  password = '';
  error = ''
 constructor(private router: Router,private authService: AuthService) {}

  onLogin() {
    this.authService.login(this.username, this.password).subscribe({
      next: () => this.router.navigate(['/dashboard']),
      error: err => {
        this.error = 'Credenciales inválidas';
        console.error(err);
      }
    });
  }
}
