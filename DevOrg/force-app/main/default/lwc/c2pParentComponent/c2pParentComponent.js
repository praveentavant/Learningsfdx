import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    showmodal = false;
    msg
    onclickhandler(){
        this.showmodal=true;
    }
    closehandle(event){
        this.msg=event.detail;
        this.showmodal=false;
    }
}