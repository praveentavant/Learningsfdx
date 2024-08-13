import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    isvisible=false;
    constructor(){
        super()
        console.log('Parent constructor called')
    }
    connectedCallback(){
        console.log('Parent connectedCallBack called');
    }
    renderedCallback(){
        console.log('parent renderedCallback called');
    }
    handleclick(){
        this.isvisible=!this.isvisible;
    }
    errorCallback(error,stack){
        console.log(error.message);
        console.log(stack);
        
    }
}