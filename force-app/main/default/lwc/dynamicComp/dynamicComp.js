import { LightningElement } from 'lwc';
export default class DynamicComp extends LightningElement {
componentname


  async connectedCallback() {
      const { default: ctor } = await import("c/demo");
    this.componentname = ctor;
}


async handleClick()
{
       const { default: ctor } = await import("c/demo2");
    this.componentname = ctor;
}
}