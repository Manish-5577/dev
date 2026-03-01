import { LightningElement,wire,track } from 'lwc';
import offsetApproach from '@salesforce/apex/PaginationApproach.offsetApproach'
const column = [{label: 'Id', fieldName : 'Id' },
{label: 'Name', fieldName : 'Name'},
{label: 'Phone', fieldName : 'Phone'},
{label: 'Email', fieldName : 'Email'}]
export default class PaginationApproach_Offset extends LightningElement {

@track listobj = [
    {id: 1, count: 1},
    {id: 2, count: 1},
    {id: 3, count: 1},
    {id: 4, count: 1}
]


// pageno = 0;
// recLimit = 10 ;
// offset = 0 ;
// conData;
// columnList = column;
// disablePrev = true;
// disablenext = false
// @wire(offsetApproach,{offset :'$offset', limits : '$recLimit'})
// data({data,error})
// {  try{
//     if(data)
//     {  if(data.length > 0){
//        this.conData = data;}
//        else{
//           this.disablenext = true;
//        }
//     }else{
//           console.log('line26',error);
//     }
// }
// catch(error){
//      console.log('line 30error', error);
// }
// }

// handleNext()
// {
//     this.pageno += 1;this.disablePrev= false;
//     this.offset =  (this.pageno)*(this.recLimit);
//     console.log(this.pageno);
//   /*  offsetApproach({offset :this.offset,limits: this.recLimit }).then((response)=>{
//          if(response.length > 0)
//          {
//             this.data = response;
//          }else{
//                  // no record found
//                  this.disablenext = true;
//          }
//     }).catch(()=>{
             
//     })*/
// }
// handlePrev()
// {    
//         if((this.pageno - 1) < 0) {   this.disablePrev = true;     return;}
//         else{this.disablePrev = false;
//         this.pageno = this.pageno -1;
//               this.offset =  (this.pageno)*(this.recLimit);
//               console.log('offset', this.offset);
//               console.log('line 57',this.pageno);
//           /*     offsetApproach({offset :this.offset,limits: this.recLimit }).then((response)=>{
//          if(response.length > 0)
//          {
//             this.data = response;
//          }else{
//                  // no record found
//                  this.disablenext = true;
//          }
//     }).catch(()=>{
             
//     })*/
//         }
// }




}