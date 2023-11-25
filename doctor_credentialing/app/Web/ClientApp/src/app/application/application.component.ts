import { Component, OnInit } from '@angular/core';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-application',
  templateUrl: './application.component.html',
  styleUrls: ['./application.component.css']
})
export class ApplicationComponent implements OnInit {

  constructor(
    private pageTitleService: PageTitleService
  ) {
  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Application');
  }

}
