import { LightningElement,track} from 'lwc';

export default class Parentcomp extends LightningElement {
    @track msz;
    handlechange(event){
        this.msz = event.detail;
    }
}