import { Injectable } from '@angular/core';
import { CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { AccountService } from '../services/account.service';

@Injectable({
  providedIn: 'root'
})
export class ApplicantGuard implements CanActivate {

  constructor(
    private accountService: AccountService,
    private router: Router
  ) { }

  canActivate(route: any, state: RouterStateSnapshot) {
    if (this.accountService.isLoggedIn()) {
      if (this.accountService.isApplicant()) {
        return true;
      } else {
        this.router.navigate(['/unauthorized']);
        return false;
      }
    } else {
      if (state.url !== '/') {
        this.router.navigate(['/'], { queryParams: { returnUrl: state.url } });
      } else {
        this.router.navigate(['/']);
      }
      return false;
    }
  }
}
