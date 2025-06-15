import { Component } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { NgIf } from '@angular/common';
import { AuthService } from '../../auth/services/auth.service';

@Component({
  standalone: true,
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],  
  imports: [RouterModule, NgIf],
})
export class DashboardComponent {
  menuVisible = true;
  username: string | null = '';

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit() {
    this.username = this.authService.getUsername();
  }
  toggleMenu() {
    this.menuVisible = !this.menuVisible;
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/']);
  }
}
