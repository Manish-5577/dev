import { LightningElement,wire,api} from 'lwc';
import wirecheck from '@salesforce/apex/WireExecution.wirecheck';
import wirecheck2 from '@salesforce/apex/WireExecution.wirecheck2'
export default class Wirecheck extends LightningElement {
 @api variable = 'lalal';
var1= '';
constructor(){
    super();
    console.log('line 7  constructor', this.variable)
}
connectedCallback() {
    console.log('line 10 connecteCallback', this.variable);
}

@wire(wirecheck,{'varr':'$variable'})
getcheck1({data,error})
{    console.log('line 17 wire ',data, this.variable);
    if(data){
        console.log('line 19 wire  ',data);
        this.var1 = data;
    }
    else if(error){
        console.log('line 22',error);
    }
}
@wire(wirecheck2,{'varr':'$var1'})
getcheck2({data,error})
{    console.log('line 27 wire2 ',data, this.variable);
    if(data){
        console.log('line 29 wire2  ',data);
    }
    else if(error){
        console.log('line 32',error);
    }
}


}