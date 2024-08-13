import { LightningElement,api } from 'lwc';

export default class ChildLwc extends LightningElement {
    handleSubstract(){
        this.dispatchEvent(new CustomEvent('substract'));
    }
    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'));
    }
    handleMultiple(event){
        const multipleValue = event.target.value;
        alert('multipleValue is : '+multipleValue);
        this.dispatchEvent(new CustomEvent('multiply' ,{
            detail:multipleValue
        }))
    }
    @api textvalue = 0;
    @api buttonClicked(){
        this.textvalue +=100;
    }
}