import { LightningElement,api } from 'lwc';
import PLAYER_OBJECT from '@salesforce/schema/player__c';
import NAME_FIELD from '@salesforce/schema/player__c.Name';
import GOAL_FIELD from '@salesforce/schema/player__c.Goal__c';
import OWNER_FIELD from '@salesforce/schema/player__c.OwnerId';
import FOORBALLCLUB_FIELD from '@salesforce/schema/player__c.Football_club__c';

export default class RecordViewForm extends LightningElement {
     objectApi = PLAYER_OBJECT;
     nameField = NAME_FIELD;
     goalField = GOAL_FIELD;
     ownerField = OWNER_FIELD;
     footBallClub = FOORBALLCLUB_FIELD;
     @api recordId;
}