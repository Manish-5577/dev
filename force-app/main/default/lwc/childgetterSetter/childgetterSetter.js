import { LightningElement,api } from 'lwc';
export default class ChildgetterSetter extends LightningElement {

valuefromParent

@api set val(value)
{ if(value == 'one')
{
    this.valuefromParent = 'huuuure'
}else{
    this.valuefromParent = 'neomi';
}
  
}

get val(){
    return this.valuefromParent;
}

}