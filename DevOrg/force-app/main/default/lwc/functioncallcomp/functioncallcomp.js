import { LightningElement } from 'lwc';
import { showToastEvent } from 'lightning/platformShowToastEvent';

export default class Functioncallcomp extends LightningElement {

    myTittle = 'Salesforce function call';

    connectedCallback(){
        let callMyFunction = this.myFunction(10,2);
       // window.alert("callMyFunction  "+callMyFunction);
    }

    myFunction= (a,b)=>{
        return (a/b);

    }

    handleClick(){
        this.showtoast();
    }

    showtoast(){
        const event = new showToastEvent({
            title : "Show toast demo",
            message : "SHowing you the toast message example ",
            variant : 'success',
        })
        this.dispatchEvent(event);
    }

}