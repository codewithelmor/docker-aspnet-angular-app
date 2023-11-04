import { HttpClient } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RelationshipCreateModel } from '../models/relationship.create.model';
import { RelationshipModel } from '../models/relationship.model';
import { RelationshipUpdateModel } from '../models/relationship.update.model';

@Injectable({
  providedIn: 'root'
})
export class RelationshipService {

    private controller = 'relationship';
  private baseAddress = `${this.baseUrl}api/${this.controller}`;

  constructor(
    @Inject('BASE_URL') private baseUrl: string,
    private httpClient: HttpClient
  ) { }

  list(): Observable<RelationshipModel[]> {
    return this.httpClient
      .get<RelationshipModel[]>(this.baseAddress);
  }

  create(model: RelationshipCreateModel): Observable<RelationshipModel> {
    return this.httpClient
      .post<RelationshipModel>(this.baseAddress, model);
  }

  update(id: number, model: RelationshipUpdateModel): Observable<any> {
    return this.httpClient
      .put<RelationshipModel>(`${this.baseAddress}/${id}`, model);
  }

  delete(id: number): Observable<any> {
    return this.httpClient
      .delete<any>(`${this.baseAddress}/${id}`);
  }

}
