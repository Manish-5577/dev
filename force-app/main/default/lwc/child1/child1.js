import { LightningElement,api } from 'lwc';
export default class Child1 extends LightningElement {

@api method1()
   {
    console.log('calling child method in parent!!');
   }

   

}