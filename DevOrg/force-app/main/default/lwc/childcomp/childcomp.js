import { LightningElement } from 'lwc';

export default class Childcomp extends LightningElement {
    onchangehandler(event) {
        const name = event.target.value;
        const selectevent = new CustomEvent('mycustomevent',{
            detail: name
        });
        this.dispatchEvent(selectevent);
    }
}