import { LightningElement,track,wire } from 'lwc';
import getContact from '@salesforce/apex/pagination.getContact'
import { getRecords ,notifyRecordUpdateAvailable, getRecord, getFieldValue} from "lightning/uiRecordApi";
import phone_field from  '@salesforce/schema/Contact.Phone';
import email_field from '@salesforce/schema/Contact.Email';
import updaterec from '@salesforce/apex/pagination.updaterec';
import { refreshApex } from '@salesforce/apex';

const column = [
    {label: 'id', fieldName : 'Id'},
     {label: 'Email', fieldName : 'Email'},
      {label: 'Phone', fieldName : 'Phone'}
]
export default class UpdateMultipleRecord extends LightningElement {
@track columns = column
@track data 
@track wiredcontact
@track selectrows = [];
@track selectrowsId = ['003gK000004tUWDQA2'];
@track contactreclist = [];
screentwo = false;
screenfirst = true;
enableSpinner = false
enablespinnertwo = false;

get recordsConfig() {
    return [
        {
            recordIds: this.selectrowsId,
            fields: [email_field],
            optionalFields: [phone_field]
        }
    ];
}


@wire(getRecord, {
    recordId: "003gK000004tUWDQA2",
    fields: [email_field, phone_field],
    optionalFields: [],
  })
  conn;
  get Email() {
    return getFieldValue(this.conn.data, email_field);
  }

  get phone() {
    return (this.conn.data, phone_field);
  }

 @wire(getRecords, { records: '$recordsConfig' })
  wiredRecords({data, error})
  {  
   if(data)
   {  console.log('wired data ',data)
        this.contactreclist = data.results;
        console.log('zeroth element',this.contactreclist[0].result.id);
   }else if(error)
   {
      console.log('line 377');
   }
  }
//   connectedCallback() {
//     getContact().then((res)=>{
//        this.data  = res;
//     }).catch((error)=>{
//          console.log('error', error);
//     })
//   }
  @wire(getContact,{})
  wiredcontactss(value){
   this.wiredcontact  = value
   const { data, error } = value;
      if(value.data)
{  this.data = data;

}else {
 console.log('error', error);
}
  }
  getSelectedName(event)
  {  console.log('line 19')
     console.log('event ==>', event);
     this.selectrowsId = event.detail.selectedRows.map((res)=> {
        return res.Id;
     })
  }
  handleClick()
  {
  this.screenfirst = false;this.screentwo = true;
  }
  handleUpdate()
  {
   
  }
  async handleupdateviaApex()
  {  this.enablespinnertwo = true;
       await updaterec();
                await notifyRecordUpdateAvailable([{recordId: this.selectrowsId}]);
                   this.enablespinnertwo = false;
         
  }
async handlesubmit(){
   //refreshApex(this.contactreclist);
  this.enableSpinner = true;
     await refreshApex(this.wiredcontact);
   //    await notifyRecordUpdateAvailable([{recordId: this.selectrowsId}]);
    this.enableSpinner = false;
    this.screentwo = false;
   this.screenfirst = true;
  }
  

}