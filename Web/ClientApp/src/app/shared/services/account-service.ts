import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { TranslationService } from './translation-service';

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
    const rawToken = this.jwtHelper.tokenGetter().toString();
    if (rawToken != null && rawToken != undefined && rawToken != '') {
        const sessionToken = JSON.parse(rawToken);
        const decodedToken = this.jwtHelper.decodeToken(sessionToken['access_token']);
        return decodedToken;
    }
    return null;
  }

  setLocale() {
    const accessToken = this.getAccessToken();
    if (accessToken != null) {
        const locale = accessToken['locale'];
        const language = locale.split('-')[0];
        this.translationService.setLanguage(language);
    }
  }

}