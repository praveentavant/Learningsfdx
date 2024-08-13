import { LightningElement,track } from 'lwc';

export default class Trackdemo extends LightningElement {

 @track fullname ={PehlaNaam:"",DusraNaam:""};

onchangehandler(event){
    let field = event.target.name;
    if(field ==='firstName'){
        this.fullname.PehlaNaam=event.target.value;
    }
  if(field === 'lastName'){
    this.fullname.DusraNaam=event.target.value;
  }
    
    
}


}