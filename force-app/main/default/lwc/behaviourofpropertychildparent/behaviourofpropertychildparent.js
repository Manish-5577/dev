import { LightningElement,track } from 'lwc';
export default class Behaviourofpropertychildparent extends LightningElement {

@track objparent = {name:'manifromparent', id : '1234353'}

visible = false;
 @track childProps = { name: "James Smith", country: "USA" };
handlechange(event)
{  let inputval = event.target.value;
      console.log('inputval', inputval);
      this.childProps.name = inputval
      console.log('line 11',this.objparent.name)

      this.contacts[1].Name= inputval;
       this.contacts[0].Name= inputval;
}
    @track contacts = [
        { Id: '001', Name: 'Amy', Title: 'Engineer' },
        { Id: '001', Name: 'Michael', Title: 'Sales' },
        { Id: '001', Name: 'Jennifer', Title: 'CEO' }
    ];

    updateSecond() {
        // Update ONLY Michael
        this.contacts[1].Title = 'Chief Sales Officer';
        this.contacts = [...this.contacts];
    }



handleClick()
{
      this.visible = true;
}
}