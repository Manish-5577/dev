import { LightningElement } from 'lwc';
import MyModal from "c/lightningModageneric";

// import ModalDemo from './lightningModageneric';
export default class Callinglwcmodal extends LightningElement {


async handlemodal() {
    console.log('line 7')
    const result = await MyModal.open({
      // `label` is not included here in this example.
      // it is set on lightning-modal-header instead
      size: "large",
      description: "Accessible description of modal's purpose",
      content: "Passed into content api",
    });
    // if modal closed with X button, promise returns result = 'undefined'
    // if modal closed with OK button, promise returns result = 'okay'
    console.log(result);
  }
}