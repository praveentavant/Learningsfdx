import { LightningElement } from 'lwc';
import PLAYER_OBJECT from '@salesforce/schema/player__c';
import NAME_FIELD from '@salesforce/schema/player__c.Name';
import EMAIL_FIELD from '@salesforce/schema/player__c.Email__c';
import GOAL_FIELD from '@salesforce/schema/player__c.Goal__c';
import FOOTBALLCLUB_FIELD from '@salesforce/schema/player__c.Football_club__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditForm extends LightningElement {
    PLAYER_NAME = NAME_FIELD;
    PLAYER_EMAIL = EMAIL_FIELD;
    PLAYER_GOAL = GOAL_FIELD;
    FOOTBALL_CLUB = FOOTBALLCLUB_FIELD;
    objectApiName = PLAYER_OBJECT;

    successHandler(event) {
        const events = new ShowToastEvent({
            title: 'Successful',
            variant: 'success',
            message: 'Player created Successfully',
        });
        this.dispatchEvent(events);
    }
}
