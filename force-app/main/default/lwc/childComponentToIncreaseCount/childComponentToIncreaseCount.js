import { LightningElement,api } from 'lwc';
export default class ChildComponentToIncreaseCount extends LightningElement {

backgrndcolor = 'backof'
returnedid
@api arritem = {
    id : '',
    name : '',
    count : ''
}
@api 
get getbackgroundfromparent()
{
    return this.backgrndcolor;
}
set getbackgroundfromparent(value)
{  console.log('line 17', value);
  if(this.arritem.id === value){
   this.backgrndcolor = 'backon';
  } else{
    this.backgrndcolor = 'backof';
  }
}

handleClick()
{  console.log('line 11 child ')
     this.dispatchEvent(new CustomEvent("next",{detail: this.arritem.id}));
     console.log('line 13'); 
}
}