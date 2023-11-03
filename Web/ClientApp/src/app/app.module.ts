import { HTTP_INTERCEPTORS, HttpClient, HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';

import { ApiAuthorizationModule } from 'src/api-authorization/api-authorization.module';
import { AuthorizeGuard } from 'src/api-authorization/authorize.guard';
import { AuthorizeInterceptor } from 'src/api-authorization/authorize.interceptor';
import { AppComponent } from './app.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import HomeComponent from './home/home.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';

import { JwtModule } from '@auth0/angular-jwt';
import { TranslationService } from '../app/shared/services/translation.service';
import { environment } from '../environments/environment';
import { AdminComponent } from './admin/admin.component';
import { ApplicationComponent } from './application/application.component';
import { NotfoundComponent } from './notfound/notfound.component';
import { AdminGuard } from './shared/auth-guards/admin-guard';
import { ApplicantGuard } from './shared/auth-guards/applicant-guard';
import { AccountService } from './shared/services/account.service';
import { UnauthorizedComponent } from './unauthorized/unauthorized.component';

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/');
}

export function tokenGetter() {
  return sessionStorage.getItem(environment.tokenName);
}

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,
    AdminComponent,
    ApplicationComponent,
    NotfoundComponent,
    UnauthorizedComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    ApiAuthorizationModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent, canActivate: [AuthorizeGuard] },
      { path: 'admin', component: AdminComponent, canActivate: [AuthorizeGuard, AdminGuard] },
      { path: 'application', component: ApplicationComponent, canActivate: [AuthorizeGuard, ApplicantGuard] },
      { path: 'unauthorized', component: UnauthorizedComponent },
      { path: '**', component: NotfoundComponent },
    ]),
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
    JwtModule.forRoot({
      config: {
        // tokenGetter: (() => {
        //   return localStorage.getItem(environment.tokenName);
        // }),
        tokenGetter: tokenGetter,
        allowedDomains: environment.origins
        // whitelistedDomains: ['example.com'],
        // blacklistedRoutes: ['example.com/examplebadroute/']
      }
    }),    
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AuthorizeInterceptor, multi: true },
    // Auth Guards
    AdminGuard,
    ApplicantGuard,
    // Services
    TranslationService,
    AccountService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
