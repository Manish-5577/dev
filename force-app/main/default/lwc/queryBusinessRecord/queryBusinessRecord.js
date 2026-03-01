import { LightningElement,wire,track } from 'lwc';
import getAllObjectList from '@salesforce/apex/QueryBuilder.getAllObjectList'
import  { getObjectInfo } from "lightning/uiObjectInfoApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getchildobjList from '@salesforce/apex/QueryBuilder.getchildobjList';
export default class QueryBusinessRecord extends LightningElement {

@track selectchildObj =''
@track selectchildObjFinal =''
@track isChecked = false;
 @track objList    = []
 @track errormssg
 selectedObj  =null
 @track childObjList =[]
 @track childexist = false
 @track metadata ;
@track selectedObjFields = [];


  @wire(getAllObjectList)
  getobjName({data,error})
  {
    if(data)
    {   console.log('data',data)
         this.objList = data; 
    }
    if(error)
    {    console.log('error',error);
         this.errormssg = error.body.message;
    }
  }

  handleChange(event)
  {   console.log('event==>>>',event.target.name);
     if(event.target.name == 'Checkbox Group')
     {
this.selectchildObj = event.detail.value;
console.log('line 32',JSON.stringify(this.selectchildObj));
     }
     else if(event.target.name == 'progress')
     {
this.selectedObj = event.detail.value;
const checkbox = this.template.querySelector('[data-id="termsCheckbox"]');
        checkbox.checked = false;
console.log('line 37',this.selectedObj);
     }
     if(event.target.name == 'child Related')
     {  console.log('line 45');
        if(event.target.checked &&  (this.selectedObj == ''  ||  this.selectedObj == null))
        {  alert('Kindly select the parent Object')
          return;
        }else{
       this.isChecked = event.target.checked;
       if(this.isChecked)
       { console.log('line 48')
        this.childexist = true;
        this.getchildobjListlogic();
       }
        }
     }
  } 

  getchildobjListlogic()
  {
getchildobjList({objName : this.selectedObj}).then((response)=>{
  console.log('line 58',response)
    if(response)
    {
      this.childObjList = response;
    }
}).catch((error)=>{
       console.log('error getting childobjList', error.body.message);
})
  }



// @wire(getObjectInfo, { objectApiName: '$selectedObj' })
// selectedObjInfo({data,error})
// {
//   if(data)
//   {   this.metadata = data;
//       console.log('metadata obj',data)
//       this.selectedObjFields = this.metadata.fields;
//       console.log('this.selected obj fields', this.selectedObjFields)
//   }
//   else if(error)
//   {
//      console.log('error obj',error)
//   }
// }


}