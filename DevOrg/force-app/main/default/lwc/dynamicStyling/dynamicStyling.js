import { LightningElement } from 'lwc';

export default class DynamicStyling extends LightningElement {
    percent=10;
    changeHandler(event){
        this.percent = event.target.value;

    }
    get style(){
        return `width:${this.percent}%`;
    }
}