import PostalCode from '@salesforce/schema/Lead.PostalCode';
import { LightningElement,track } from 'lwc';

export default class HelloWorld extends LightningElement {
  
  company="Capgemini"
  name="Praveen"
  binding(event){
    this.name=event.target.value


  }
   @track Address={
    city:'Dhanbad',
    Postcode:826001,
    State:'Jharkhand',
    country:'India'

  }
  cityhandler(event){
    this.Address.city=event.target.value
  }

  // getter Example
  user=["Shyam","Ram","Sita","Radha"]
  num1=10
  num2=20

  get firstuser(){
    return this.user[1].toLocaleUpperCase()
  }
  get multiply(){
    return this.num1 * this.num2
  }
  
  }