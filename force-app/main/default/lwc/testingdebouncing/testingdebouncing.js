import { LightningElement } from 'lwc';
export default class Testingdebouncing extends LightningElement {
timeoutId;

handledebouncing(event)
{ console.log(event.target.value);
  clearTimeout(this.timeoutId);
  this.timeoutId =   setTimeout(()=>{
  this.test();
  }, 1000)
}
test()
{
    console.log('debouncing achieved ');
}
}