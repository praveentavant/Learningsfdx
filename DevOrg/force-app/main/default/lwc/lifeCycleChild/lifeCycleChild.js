import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    constructor(){
        super()
        console.log('Child constructor called')
    }
    connectedCallback(){
        console.log('Child connectedCallBack called');
       throw new Error('Loading of child component failed');
    }
    renderedCallback(){
        console.log('Child renderedCallback called');
    }
    disconnectedCallback(){
        alert('Child Disconnected callback is called...');
    }
    
}