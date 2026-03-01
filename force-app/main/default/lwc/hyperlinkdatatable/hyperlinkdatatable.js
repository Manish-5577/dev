import { LightningElement,track,wire } from 'lwc';
import getacctData  from '@salesforce/apex/pagination.getacctData'
const accColumn = [
    {label:'Id', fieldName : 'Id'},
    {label:'AccName', fieldName : 'AccLink',  type: 'url' ,typeAttributes :{
        label : {fieldName : 'Name'},
        target : "_blank"
    }},
]
export default class Hyperlinkdatatable extends LightningElement {
columns = accColumn;
@track accData;


     @wire(getacctData,{})
     getaccData({data,error})
     {
        if(data)
        {
            let response = JSON.parse(JSON.stringify(data));
             response.map((res)=>{
                res.AccLink = '/' + res.Name;
             })
             this.accData = response;
        }
        else if(error)
        {
              console.log('oops something went wrong happen!!!!!');
        }
     }

}