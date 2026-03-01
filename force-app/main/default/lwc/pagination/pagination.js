import { LightningElement,api,track } from 'lwc';
import onloadingbeh from '@salesforce/apex/pagination.onloadingbeh'
import getchildenrolee from '@salesforce/apex/pagination.getchildenrolee'
const columns = [
    {label: 'Id', fieldName : 'Id'},
    {label: 'Testing', fieldName : 'testing__c'},
    {label: 'Name', fieldName : 'Name'}
]
const mapint = new Map();
export default class Pagination extends LightningElement {
column = columns
@track data =[];
limits = 20;
lastids ;
disablenext = false; currentpage = 0;
disablepre = true;
connectedCallback() {
     getchildenrolee().then((res)=>{
        let j =0;
         for(let i =0; i < res.length; i+=20)
         {   console.log(i,j);
            mapint.set(j, res.slice(i,i+20));
            console.log(mapint);
            j++;
         //   this.limits += 20;
         }
   //      this.data.push(mapint.get(0));
         this.data =  mapint.get(0);

     }).catch((error)=>{
             console.log('error !!!! line 25', error);
     });
}
  handlenext()
  { this.disablepre = false;
     this.currentpage++;
     if(mapint.has(this.currentpage))
     {  
        this.data = [];
        this.data = mapint.get(this.currentpage);
       //  this.data = [...this.data, mapint.get(0)];
     }else{
        // no record found 
        this.disablenext = true;
     }

  }
  handleprev()
  {     this.currentpage--;
         if(mapint.has(this.currentpage))
     {
        this.data = '';
        this.data = mapint.get(this.currentpage);
     }else{
        // no record found 
        this.disablepre = true;
     }

  }
 handlemap()
 {
    console.log()
 }



/*
loadMoreData()
{
   this.loaddata();
}
 loaddata()
 {      onloadingbeh({limits: this.limits, ids : this.lastids }).then((res)=>{
                       this.data = res;
                       this.lastids = this.data[(this.data).length-1].Id;
                       console.log('this.lastids'+this.lastids);
             }).catch((error)=>{
                       console.log('error ==> line 23', error);
             })
 }
*/






}