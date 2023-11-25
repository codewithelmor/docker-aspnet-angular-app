import { Component, OnInit } from '@angular/core';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-notfound',
  templateUrl: './notfound.component.html',
  styleUrls: ['./notfound.component.css']
})
export class NotfoundComponent implements OnInit {

  constructor(
    private pageTitleService: PageTitleService
  ) {
  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Not Found');
  }

}
