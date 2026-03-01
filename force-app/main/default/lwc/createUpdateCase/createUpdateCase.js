import { LightningElement,wire,api,track} from 'lwc';
import getRelatedCase from '@salesforce/apex/pagination.getRelatedCase'
import { updateRecord } from "lightning/uiRecordApi";
import { refreshApex } from '@salesforce/apex';
export default class CreateUpdateCase extends LightningElement {

@api recordId
@track caseRecList = []
@track wirecaselist;
interval
 @wire(getRelatedCase, { recordId: '$recordId' })
    wireCase(value) {
        this.wirecaselist = value;
        if (value.data) {
            this.caseRecList = JSON.parse(JSON.stringify(value.data))
                .map(rec => ({
                    ...rec,
                    isEditing: false,
                    isReadOnly: true  
                }));
        } else if (value.error) {
            console.error(value.error);
        }
    }
    Enableedit(event) {
        const index = event.target.dataset.index;
        this.caseRecList = this.caseRecList.map((rec, i) => {
            if (i === Number(index)) {
                return {
                    ...rec,
                    isEditing: true,
                    isReadOnly: false
                };
            }
            return {
                ...rec,
                isEditing: false,
                isReadOnly: true
            };
        });
    }
handleUpdate(event)
{
   let recToUpd = this.caseRecList[event.target.dataset.index];
   const fields = {
       Id: recToUpd.Id,
       Origin: recToUpd.Origin, // Example field to update 
       ContactEmail: recToUpd.ContactEmail// Another example field
}; console.log('line 37',JSON.stringify(fields));
const recordInput = { fields };
      updateRecord(recordInput).then((res)=>{
         console.log('line 53 suucess') ;
          this.refreshApex(wirecaselist);   
      }).catch((error)=>{
  console.log('line 555');
  console.log('error',error);
    if (error.body && Array.isArray(error.body)) {
                error.body.forEach((err) => {
                    if (err.fields) {
                        err.fields.forEach((fieldName) => {
                            this.highlightFieldError(index, fieldName, err.message);
                        });
                    }
                });
            }
        });
}
handlechange(event)
{ 
    const index = event.currentTarget.dataset.set;
    const name = event.currentTarget.name;
    const value = event.currentTarget.value;
    console.log('line 46');
    if (index === undefined || !this.caseRecList[index]) return;
      this.caseRecList[index][name] = value;
    this.caseRecList = [...this.caseRecList]; // refresh UI
    console.log('line 50',JSON.stringify(this.caseRecList[index]));
}
async handlerlogic()
{
    await refreshApex(this.wirecaselist);
}

// Highlight a field error using data-set attribute
highlightFieldError(index, fieldName, message) {
    // Query the input with matching name and data-set
    const fieldElement = this.template.querySelector(
        `lightning-input[name="${fieldName}"][data-set="${index}"]`
    );
    if (fieldElement) {
        fieldElement.classList.add('error'); // add red border
        fieldElement.setCustomValidity(message); // set the error message
        fieldElement.reportValidity(); // show the error
    }
}

// Clear previous errors for a row
clearFieldErrors(index) {
    const fields = ['Origin', 'ContactEmail', 'Status']; // all editable fields
    fields.forEach((fieldName) => {
        const fieldElement = this.template.querySelector(
            `lightning-input[name="${fieldName}"][data-set="${index}"]`
        );
        if (fieldElement) {
            fieldElement.classList.remove('error');
            fieldElement.setCustomValidity('');
            fieldElement.reportValidity();
        }
    });
}


}