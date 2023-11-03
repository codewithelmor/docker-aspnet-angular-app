import { Component, OnInit } from '@angular/core';
import { AccountService } from '../shared/services/account-service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export default class HomeComponent implements OnInit {

  constructor(private accountService: AccountService) {

  }

  ngOnInit(): void {
    this.accountService.setLocale();
  }

}
