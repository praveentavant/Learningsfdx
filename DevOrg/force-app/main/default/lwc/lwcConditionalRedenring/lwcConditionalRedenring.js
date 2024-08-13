import { LightningElement,track } from 'lwc';

export default class LwcConditionalRedenring extends LightningElement {
   @track property1 = false;
   @track buttonLabel = 'Button';
    @track property2 = false;

    onclickHandler(){
        if( this.property1 ==true){
            this.property1 = false;
            this.buttonLabel = 'property2';
        }
        else{
            this.property1 = true;
            this.buttonLabel = 'property1';
        }
       
    }
}