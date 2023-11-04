import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit } from '@angular/core';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-fetch-data',
  templateUrl: './fetch-data.component.html'
})
export class FetchDataComponent implements OnInit {

  public forecasts: WeatherForecast[] = [];

  constructor(
    private pageTitleService: PageTitleService,
    http: HttpClient,
    @Inject('BASE_URL') baseUrl: string) {

    http.get<WeatherForecast[]>(baseUrl + 'weatherforecast').subscribe(result => {
      this.forecasts = result;
    }, error => console.error(error));

  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Fetch Data');
  }

}

interface WeatherForecast {
  date: string;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}
