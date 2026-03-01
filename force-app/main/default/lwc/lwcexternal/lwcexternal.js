import { LightningElement } from 'lwc';
export default class Lwcexternal extends LightningElement {

  fillExternalDiv() {
        // Get the external div
        const externalDiv = this.template.querySelector('#externalDiv');

        // Add content dynamically
        externalDiv.innerHTML = `
            <p style="color: blue; font-weight: bold;">
                This content is added dynamically and LWC won’t touch it!
            </p>
        `;
    }
}