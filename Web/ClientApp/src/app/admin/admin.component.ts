import { Component, OnInit } from '@angular/core';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  constructor(
    private pageTitleService: PageTitleService
  ) {    
  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Admin');
  }

}
