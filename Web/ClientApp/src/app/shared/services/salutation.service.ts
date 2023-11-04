import { HttpClient } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { SalutationCreateModel } from '../models/salutation.create.model';
import { SalutationModel } from '../models/salutation.model';
import { SalutationUpdateModel } from '../models/salutation.update.model';

@Injectable({
  providedIn: 'root'
})
export class SalutationService {

    private controller = 'salutation';
  private baseAddress = `${this.baseUrl}api/${this.controller}`;

  constructor(
    @Inject('BASE_URL') private baseUrl: string,
    private httpClient: HttpClient
  ) { }

  list(): Observable<SalutationModel[]> {
    return this.httpClient
      .get<SalutationModel[]>(this.baseAddress);
  }

  create(model: SalutationCreateModel): Observable<SalutationModel> {
    return this.httpClient
      .post<SalutationModel>(this.baseAddress, model);
  }

  update(id: number, model: SalutationUpdateModel): Observable<any> {
    return this.httpClient
      .put<SalutationModel>(`${this.baseAddress}/${id}`, model);
  }

  delete(id: number): Observable<any> {
    return this.httpClient
      .delete<any>(`${this.baseAddress}/${id}`);
  }

}
