import { Component, OnInit } from '@angular/core';
import { PageTitleService } from '../shared/services/page-title.service';

@Component({
  selector: 'app-counter-component',
  templateUrl: './counter.component.html'
})
export class CounterComponent implements OnInit {

  public currentCount = 0;
  
  constructor(
    private pageTitleService: PageTitleService
  ) {
  }

  ngOnInit(): void {
    this.pageTitleService.setTitle('Counter');
  }

  public incrementCounter() {
    this.currentCount++;
  }
}
