import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ScreenFlowCheck extends LightningElement {
    @api message = 'How are you Sir..!';
    @api title = 'Toast From Flow';
    @api variant;

showToast(){
    alert('Called from LWC');
    const event = new ShowToastEvent({
            title: this.title,
            message: this.message,
            variant: this.variant,
    });
    this.dispatchEvent(event);
}

}