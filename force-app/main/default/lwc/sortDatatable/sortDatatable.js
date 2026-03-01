import { LightningElement,wire } from 'lwc';
import getoppTime from '@salesforce/apex/pagination.getoppTime'
const column = [
    {label: 'Id', fieldName: 'Id'},
    {label: 'closeDate', fieldName: 'closeDate',sortable: true},
    {label: 'Name', fieldName: 'Name'},
    {label: 'CreatedDate', fieldName: 'CreatedDate', sortable: true}
]
export default class SortDatatable extends LightningElement {
columnlist = column;
oppList 
sortDirection = 'asc';
sortedBy;
@wire(getoppTime,{})
oppdata({data,error}){
if(data)
{  this.oppList = data;
  
}else{
    console.log('error line 11', error)
}
}

 handleSort(event) {
        console.log('line 25');
        const { fieldName, sortDirection } = event.detail;
        console.log('line 26');

        const cloneData = [...this.oppList];
        console.log('line 27');

        cloneData.sort(this.sortBy(fieldName, sortDirection));
        console.log('line 28');

        this.oppList = cloneData;
        console.log('line 29');

        this.sortDirection = sortDirection;
        console.log('line 30');

        this.sortedBy = fieldName;
        console.log('line 31');
    }

    sortBy(field, direction) {
        return (a, b) => {
            let x = a[field];
            let y = b[field];

            // Handle null values
            if (x === null || x === undefined) return 1;
            if (y === null || y === undefined) return -1;

            // Handle dates correctly
            if (field.toLowerCase().includes('date')) {
                x = new Date(x);
                y = new Date(y);
                return direction === 'asc' ? x - y : y - x;
            }

            // Default text/number sorting
            return direction === 'asc'
                ? (x > y ? 1 : -1)
                : (x < y ? 1 : -1);
        };
    }


}