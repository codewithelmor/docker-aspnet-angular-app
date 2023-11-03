import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { TranslationService } from './translation.service';
import { includes } from 'lodash';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(
    private jwtHelper: JwtHelperService,
    private translationService: TranslationService) {}

  init() {
  }

  getAccessToken(): any | null {
    const rawToken: any = this.jwtHelper.tokenGetter();
    if (rawToken != null && rawToken != undefined && rawToken != '') {
        const sessionToken = JSON.parse(rawToken);
        return sessionToken['access_token'];
    }
    return null;
  }

  getDecodedToken(): any | any {
    const token = this.getAccessToken();
    if (token) {
      const decodedToken = this.jwtHelper.decodeToken(token);
      return decodedToken;
    }
  }

  isLoggedIn(): boolean {
    const token = this.getAccessToken();
    if (token) {
      const isTokenExpired = this.jwtHelper.isTokenExpired(token);
      if (isTokenExpired) {
        sessionStorage.clear();
      }
      return !isTokenExpired;
    }
    return false;
  }

  isApplicant(): boolean {
    const token = this.getDecodedToken();
    if (token) {
      return includes(token['role'], "Applicant");
    }
    return false;
  }

  setLocale() {
    const decodedToken = this.getDecodedToken();
    if (decodedToken != null) {
        const locale = decodedToken['locale'];
        const language = locale.split('-')[0];
        this.translationService.setLanguage(language);
    }
  }

}