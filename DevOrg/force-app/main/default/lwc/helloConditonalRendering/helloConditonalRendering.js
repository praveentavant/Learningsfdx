import { LightningElement } from 'lwc';

export default class HelloConditonalRendering extends LightningElement {
    isvisible=false
    name
    handleClick(){
        this.isvisible=false

    }
    handleClick1(){
        this.isvisible=true

    }
    ChangeHandler(event){
        this.name=event.target.value
    }
    get getMethod(){
       return this.name==="Hello"
    }
}