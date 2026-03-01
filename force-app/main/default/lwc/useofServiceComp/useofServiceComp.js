import { LightningElement } from 'lwc';
import { validateEmail, addtoNo } from 'c/servicecomp';
export default class UseofServiceComp extends LightningElement {
no1 
no2
result;
handleClick()
{       console.log('line 8');
         this.result =    addtoNo(this.no1, this.no2);
         console.log('result',this.result)
}
handleno1(event)
{
    this.no1 = Number(event.detail.value);
}
handleno2(event)
{
    this.no2 = Number(event.detail.value);
}
}