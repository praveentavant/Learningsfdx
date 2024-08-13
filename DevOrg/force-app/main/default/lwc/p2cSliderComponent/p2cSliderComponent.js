import { LightningElement,api } from 'lwc';

export default class P2cSliderComponent extends LightningElement {
    val=20;
    changehandler(event){
        this.val=event.target.value;
    }

    @api resethandler(){
        this.val=50;
    }
    
}