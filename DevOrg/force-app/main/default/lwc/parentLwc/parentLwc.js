import { LightningElement } from 'lwc';

export default class ParentLwc extends LightningElement {
    countValue =0;
    handleDecrement(){
        this.countValue--;
    }
    handleIncrement(){
        this.countValue++;
    }
    handleMultiply(event){
        const multiplyFactor = event.detail;
        alert('multiplyFactor is : '+multiplyFactor);
        this.countValue*=multiplyFactor;
    }
    inputText = 0;
    onChangeHandler(event){
        this.inputText = parseInt(event.target.value);
    }
    buttonClick(){
        this.template.querySelector('c-child-lwc').buttonClicked();
    }
}