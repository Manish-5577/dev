import { LightningElement,track,wire } from 'lwc';
export default class Debouncingtest extends LightningElement {

timerId = '';

handlechange(event)
{
   console.log(event.detail);
     window.clearTimeout(this.timerId);
 this.timerId =   setTimeout(()=>{
        console.log('execute after 900 sec');
   }, 3000)
}

}