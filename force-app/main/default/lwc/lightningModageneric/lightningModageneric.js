import { LightningElement,api  } from 'lwc';
import LightningModal from 'lightning/modal';

export default class LightningModageneric extends LightningModal {

  @api content;
  handleOkay() {
    this.close('okay');

   
}


fireEvent()
{
        this.dispatchEvent(
            new CustomEvent('confirm', {
                detail: { status: 'ok' },
                bubbles: true,
                composed: true
            })
        );

}

  }