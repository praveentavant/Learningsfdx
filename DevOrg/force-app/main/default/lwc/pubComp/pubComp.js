import { LightningElement,wire } from 'lwc';
import { publish,MessageContext } from 'lightning/messageService';
import  COUNTING_UPDATE_CHANNEL  from '@salesforce/messageChannel/count_update__c';
export default class PubComp extends LightningElement {

    @wire(MessageContext)
    messageContexts;

    handleIncrement(){

        const payload={
            operator:'add',
            constant:1

        };

        publish(this.messageContexts,COUNTING_UPDATE_CHANNEL,payload );
    }
    handleDecrement(){
        const payload={
            operator:'substract',
            constant:2

        };
        publish(this.messageContexts,COUNTING_UPDATE_CHANNEL,payload );

    }
    handleMultiplications(){
        const payload={
            operator:'multiply',
            constant:2

        };
        publish(this.messageContexts,COUNTING_UPDATE_CHANNEL,payload );

    }

}