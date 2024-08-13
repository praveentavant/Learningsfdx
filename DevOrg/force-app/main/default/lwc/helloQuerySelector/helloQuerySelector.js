import { LightningElement } from 'lwc';

export default class HelloQuerySelector extends LightningElement {
    userNames =["John","smith","Ram","Mike"] 
    fetchDetailsHandler(){
        let myButton=this.template.querySelector('h1');
        myButton.style.border="2px solid Red";
        console.log(myButton.innerText);
        
        const element = this.template.querySelectorAll('.name');
        
        Array.from(element).forEach(item => {
            console.log(item.innerText);
            
            
        });
        const lwcdom = this.template.querySelector('.child');
        lwcdom.innerHTML = '<p>Hey! I am a child element being added in your js and rendering from html</p>'
            
        
        
    }
  



}


  // userNames =["John","smith","Ram","Mike"] 
    // clickhandler(){
    //     const elem =this.element.querySelector('h1')
    //     const userElement = this.element.querySelectorAll('.name')
    //     console.log(elem.innerText)
    //     Array.from(userElement).forEach(item => {
    //         console.log()
            
    //     });
    // }