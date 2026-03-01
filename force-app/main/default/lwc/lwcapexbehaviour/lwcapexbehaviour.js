import { LightningElement,wire } from 'lwc';
import abcc from '@salesforce/apex/casehandler.abcc'
export default class Lwcapexbehaviour extends LightningElement {
countt

@wire(abcc)
bbb({data,error})
{
    if(data)
    {
            this.countt = data;
    }
    else if(error)
    { console.log('erroo222',error)

    }
}
}