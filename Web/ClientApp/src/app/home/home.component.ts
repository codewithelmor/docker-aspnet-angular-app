import { Component, OnInit } from '@angular/core';
import { AccountService } from '../shared/services/account.service';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export default class HomeComponent implements OnInit {

  constructor(
    private pageTitleService: PageTitleService,
    private accountService: AccountService) {
  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Home');
    this.accountService.setLocale();
  }

}
