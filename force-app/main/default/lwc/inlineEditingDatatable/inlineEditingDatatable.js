import { LightningElement,wire,track} from 'lwc';
import getoppTime from '@salesforce/apex/pagination.getoppTime'
import { refreshApex } from '@salesforce/apex';
import  {updateRecord, getRecord}  from "lightning/uiRecordApi";
import handleopp from '@salesforce/apex/pagination.handleopp'

const column = [
    {label : 'Id', fieldName : 'Id'},
    {label : 'closeDate', fieldName : 'CloseDate', editable : true},
    {label : 'Name', fieldName : 'Name', editable : true},
    {label : 'createddate', fieldName : 'CreatedDate'},
     {label : 'AccountId', fieldName : 'AccountId'},
     {label : 'OppAccName', fieldName : 'OppAccName', editable : true},
     {
        type : 'action',
        typeAttributes: { rowActions:  [
          {'label': 'View Con',
                    'iconName': 'utility:adduser',
                    'name': 'Con'},
          {'label': 'View Opp',
                    'iconName': 'utility:adduser',
                    'name': 'OPP'}
        ]},
    }
]
const FIELDS = ["Opportunity.Id", "Opportunity.Name"];

export default class InlineEditingDatatable extends LightningElement {

columnn = column
@track datalist = [];
showdatatable = true;
showspinner = false;
myMap = new Map();
@track selectedRec = []
viewcon = false;
viewopp = false;
selectedAccid = '';
   recordId = '006gK000003ZqJlQAK'
  Opportunity;
  name;
  Id;
  @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
  wiredRecord({ error, data }) {
    if (error) {
      let message = "Unknown error";
      if (Array.isArray(error.body)) {
        message = error.body.map((e) => e.message).join(", ");
      } else if (typeof error.body.message === "string") {
        message = error.body.message;
      }
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error loading contact",
          message,
          variant: "error",
        }),
      );
    } else if (data) {
      this.Opportunity = data;
      this.name = this.Opportunity.fields.Name.value;
      this.phone = this.Opportunity.fields.Id.value;
    }
  }

connectedCallback() {
    console.log('connected call back executed !!!!')
}
@track wiredataa;
@wire(getoppTime,{})
getoppRec(result)
{    this.wiredataa = result;
     console.log(result)
    if(result.data){
       let response = JSON.parse(JSON.stringify(result.data)); 
        console.log(response)
              response.map((res)=>{
              //  console.log('line 27',res.Account.Name);
                   res.OppAccName =  res.Account?.Name || ''
                   this.myMap.set(res.Id, res);
              })
                this.datalist = response
                 console.log('line 2999')
    }
    else if(result.error){
        console.log('error==',result.error);
    }
} 
handleSave(event)
{     let recToUpdate = [];
    //     this.showdatatable  = false;
     //    this.showspinner  = true;
     this.saveDraftValues = event.detail.draftValues;console.log('line 40')
     this.saveDraftValues.map((draft)=>{console.log('line 41',draft)
       let fields= {}
           fields.Id = this.datalist[Number(draft.id.split('-')[1])].Id;
          for( let key in draft){
              if( key == 'id') continue;
            fields[key] = draft[key];
             console.log('line 48',fields[key]);
          }
                const recordInput = { fields };
                this.updatelogic(recordInput);    
     })
    console.log('line 52',JSON.stringify(recToUpdate));
}

updatelogic(recinput)
{    console.log('line 588');
     console.log('recinput==>',JSON.stringify(recinput));
   updateRecord(recinput).then(()=>{
            console.log('success');
            refreshApex(this.wiredataa)
            this.showdatatable = true;
          //  this.showspinner = false;
        }).catch((error)=>{
            console.log('erroro!!!',error)
            this.showdatatable = true
        //    this.showspinner = false;
        })
}

getSelectedName(event)
{    
     event.detail.selectedRows.map((res)=>{
         let rec = {};
         rec.Id = res.Id;
         rec.CloseDate = res.CloseDate;
         rec.Name = res.Name;
         this.selectedRec.push(rec);
     })

     console.log(this.myMap);
}
handleClick()
{
       handleopp({oppList :this.selectedRec}).then(()=>{
           console.log('success imperative approach')
       }).catch((error)=>{
            console.log('erriroro!!! imperative',error)
       })
}
handleRowAction(event)
{ console.log('row level action',JSON.stringify(event.detail.action));
console.log('row level action',JSON.stringify(event.detail.row));
   if(event.detail.action.name = 'con')
   {
      this.viewcon = true;
     console.log('line 149')
   }else{
       this.viewopp = true;
       console.log('line 152')
   }
    this.selectedAccid = event.detail.row.AccountId ? event.detail.row.AccountId :''
    console.log('this.selectedAccId',this.selectedAccid);

    // const childelement = this.template.querySelector('c-showcasechild-rec');
    // console.log('childelement ',childelement);
    // if (childelement) {
    //     console.log('line 159')
    //         childelement.childmethodcallingApex(this.selectedAccid); 
    //         console.log('line 161')
    //     }
setTimeout(() => {
    const child = this.template.querySelector('c-showcasechild-rec');
    if (child) {
        child.childmethodcallingApex(this.selectedAccid);
    }
}, 0);


}

}