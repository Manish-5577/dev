import { LightningElement } from 'lwc';
export default class LightninglockerLwc extends LightningElement {

handleClick(){

        // Access div
        const div = this.template.querySelector('Div');
        console.log('div',div);
        console.log('div::',this.template.querySelector('Div'))
        console.log('Div ID:', div.id);
        // Access paragraph
        const para = this.template.querySelector('.para1');
        console.log('Paragraph Text:', para.textContent);
         const button = this.template.querySelector('.myBtn');
          console.log('lightning button', button);

    console.log('Label:', button.label);
    button.label = 'Clicked!';
    }


}