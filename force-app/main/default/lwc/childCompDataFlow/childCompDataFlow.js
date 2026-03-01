import { LightningElement,api } from 'lwc';
export default class ChildCompDataFlow extends LightningElement {


@api objfromParent
logicCalledFromParent()
{
    console.log('method called')
}

connectedCallback() {
    console.log('objfromParent==>',this.objfromParent);
}

handleclick()
{
    console.log('line 177',JSON.stringify(this.objfromParent[0].count));
    this.objfromParent[0].count = 88;
    console.log('line 19');
}
}