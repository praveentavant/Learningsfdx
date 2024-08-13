import { LightningElement } from 'lwc';
import PLAYER_OBJECT from '@salesforce/schema/player__c';

export default class DefaultRecordForm extends LightningElement {
    objectApiName = PLAYER_OBJECT;
}