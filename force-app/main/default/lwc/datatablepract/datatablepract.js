import { LightningElement,wire } from 'lwc';
import abcc from '@salesforce/apex/casehandler.abcc'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const actions = [
    { label: 'View', name: 'view' },
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
];

const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: actions,
            menuAlignment: 'auto'  // optional — can be right, left, auto, bottom-left, etc.
        }
    }
];
export default class Datatablepract extends LightningElement {
columnsList = columns;
dataList = [];

@wire(abcc)
bbb({data,error})
{
    if(data)
    {
            this.dataList = data;
    }
    else if(error)
    { console.log('erroo222',error)

    }
}
handleRowAction(event)
{let acc = [];
 console.log(acc);
               const action = event.detail.action;
            const row = event.detail.row;
          console.log('line41',JSON.stringify(row));
          console.log('line 41', JSON.stringify(action));
}

handleselectedrow(event)
{
      console.log('event==>',event.detail.selectedRows);
}
 handleSubmit(event) {
        event.preventDefault(); // stop default submit

        const fields = event.detail.fields;

        // Get field references
        const firstNameField = this.template.querySelector('[data-id="firstName"]');
        const lastNameField = this.template.querySelector('[data-id="lastName"]');
        const birthdateField = this.template.querySelector('[data-id="birthdate"]');
        const phoneField = this.template.querySelector('[data-id="phone"]');
        const levelField = this.template.querySelector('[data-id="level"]');

        // Clear previous errors
        [firstNameField, lastNameField, birthdateField, phoneField, levelField].forEach(field => {
            field.setCustomValidity("");
            field.reportValidity();
        });

        let isValid = true;

        // First Name validation
        if (!fields.FirstName || fields.FirstName.length < 2) {
            firstNameField.setCustomValidity("First Name must be at least 2 characters.");
            firstNameField.reportValidity();
            isValid = false;
        }

        // Last Name validation
        if (!fields.LastName || fields.LastName.length < 2) {
            lastNameField.setCustomValidity("Last Name must be at least 2 characters.");
            lastNameField.reportValidity();
            isValid = false;
        }

        // Birthdate validation (cannot be in the future)
        if (fields.Birthdate && new Date(fields.Birthdate) > new Date()) {
            birthdateField.setCustomValidity("Birthdate cannot be in the future.");
            birthdateField.reportValidity();
            isValid = false;
        }

        // Phone validation (must be 10 digits)
        const phoneRegex = /^[0-9]{10}$/;
        if (fields.Phone && !phoneRegex.test(fields.Phone)) {
            phoneField.setCustomValidity("Phone number must be exactly 10 digits.");
            phoneField.reportValidity();
            isValid = false;
        }

        // Level__c picklist validation (required)
        if (!fields.Level__c) {
            levelField.setCustomValidity("Please select a Level.");
            levelField.reportValidity();
            isValid = false;
        }

        // Submit the form only if valid
        if (isValid) {
            this.template.querySelector('lightning-record-edit-form').submit(fields);
        }
    }

    handleSuccess(event) {
        this.showToast('Success', 'Contact updated successfully', 'success');
    }

    handleError(event) {
        this.showToast('Error', event.detail.message, 'error');
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}