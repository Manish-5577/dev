import { LightningElement } from 'lwc';
export default class Parent1 extends LightningElement {


 simpleProps = {
    name: 'LWC',
    onclick: this.spreadClick.bind(this)
  };

  spreadClick() {
    this.simpleProps = {
      name: 'Lightning Web Components'
    };
  }

handlechildmethod()
{
   // console.log('line 9',this.template.querySelector('c-child1').method1());
   console.log('line10')
       const child = this.template.querySelector('c-child1');
        child.method1();
}
}