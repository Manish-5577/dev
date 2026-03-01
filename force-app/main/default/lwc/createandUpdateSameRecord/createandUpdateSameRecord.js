import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class CreateandUpdateSameRecord extends LightningElement {


contacRec = {
    Id : '',
    lastname : '',
    phone : '',
    email : ''
}

handlechange(event)
{   console.log('line 13',event.target.name);
     console.log('line 14',event.target.value);
    this.contacRec[event.target.name] = event.target.value;
}
async handleClick()
{
     if(this.contacRec.Id != ''){
       // update record logic 
     }else{
  const fields = {};
    // Map the user input to the fields
    fields['LastName'] = this.contacRec.lastname;
     fields['Phone'] = this.contacRec.phone;
      fields['Email'] = this.contacRec.email;
    // Configure your recordInput object with the object and field API names
    const recordInput = { apiName: "Contact", fields };
    try {
      // Invoke createRecord
      const account = await createRecord(recordInput);
      console.log('account',account);
      console.log('line 28');
    } catch (error) {
      // Handle error
      console.log('line 30',error)
    }
     }
  
}
}