import { LightningElement } from 'lwc';
import userId from '@salesforce/user/Id';
export default class GetCurrentLoggedInUserCommunity extends LightningElement {

connectedCallback() { 
 console.log('CommunityHome connectedCallback');
        console.log('current logged in user id',userId);
      window.dispatchEvent(new CustomEvent('Current_User_Id',
        {detail: {id :userId}  ,
          composed: true,
          bubbles :true,
        }))
        

}
}