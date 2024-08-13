import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html'
import signupTemplate from './signupTemplate.html'
import renderTemplate from './renderMethod.html'

export default class RenderMethod extends LightningElement {
    Buttonclick
    render(){
        return this.Buttonclick==='signup' ? signupTemplate :
                this.Buttonclick==='signin' ? signinTemplate :
                renderTemplate;
    }
    handleclick(event){
        this.Buttonclick=event.target.label

    }
    submitHandler(event){
        console.log(`${event.target.label} Succesfully ...!`);
    }

}