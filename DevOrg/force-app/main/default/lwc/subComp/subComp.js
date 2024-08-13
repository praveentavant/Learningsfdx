import { LightningElement,wire } from 'lwc';
import { subscribe,MessageContext } from 'lightning/messageService';
import  COUNTING_UPDATE_CHANNEL  from '@salesforce/messageChannel/count_update__c';


export default class SubComp extends LightningElement {
    counter =0;
    subscription = null;
    
    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel(){
        this.subscription = subscribe(
            this.messageContext,
            COUNTING_UPDATE_CHANNEL,
            (message)=> this.handleMessage(message)
        );
    }

    handleMessage(message){
        //alert("this has been presented from Subscribe channel: "+JSON.stringify(message));
        if(message.operator == 'add'){
            this.counter += message.constant; 
        }
        if(message.operator == 'substract'){
            this.counter -= message.constant;
        }
        if(message.operator == 'multiply'){
            this.counter *=message.constant;
        }
    }
}