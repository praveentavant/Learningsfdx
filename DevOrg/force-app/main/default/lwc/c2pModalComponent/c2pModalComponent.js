import { LightningElement } from 'lwc';

export default class C2pModalComponent extends LightningElement {
    closehandler(){
        const myevent = new CustomEvent('close',{
            detail: "Modal closed successfully !.."
        })
        this.dispatchEvent(myevent)
    }
}