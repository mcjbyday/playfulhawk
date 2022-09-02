import { LightningElement } from 'lwc';

export default class HelloMars extends LightningElement {
    greeting = 'Mars';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
  }