import { LightningElement, api, track } from 'lwc';
import getPlayersList from '@salesforce/apex/AssignCaptainForClub.getPlayersList';
import assignClubCaptain from '@salesforce/apex/AssignCaptainForClub.assignClubCaptain';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

const actions = [
    { label: 'Assign', name: 'Assign' },
    { label: 'View', name: 'view' },
];

const columns = [
    { label: 'Players', fieldName: 'Name' },
    { label: 'Goal', fieldName: 'Goal__c' },
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class CaptainAssignment extends NavigationMixin(LightningElement) {
    @track showPlayers = "Show Players";
    @track isVisible = false;
    @api recordId;
    @track data = [];
    @track playerList = [];
    columns = columns;
    @track error = [];

    connectedCallback() {
        console.log('recordId== ' + this.recordId);
        getPlayersList({ selectedId: this.recordId })
            .then(result => {
                console.log('result=> ' + JSON.stringify(result));
                this.data = result;
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleClick(event) {
        let label = event.target.label;

        if (label === "Show Players") {
            this.showPlayers = "Hide Players";
            this.isVisible = true;
        } else if (label === "Hide Players") {
            this.showPlayers = "Show Players";
            this.isVisible = false;
        }
    }

    handleOnRowAction(event) {
        window.alert('handleOnRowAction called');
        const actionName = event.detail.action.name;
        window.alert('actionName==> ' + actionName);
        const row = event.detail.row;
        window.alert('rowselected== '+JSON.stringify(row));

        switch (actionName) {
            case 'Assign':
                this.assignCaptain(row);
                break;
            case 'view':
                window.alert('inside view');
                this.navigateToPlayerRecordPage(row);
                break;
            default:
                break;
        }
    }

    assignCaptain(currentRow) {
        const selectedRow = currentRow;
        window.alert('selectedRowID = '+selectedRow.Id);
        assignClubCaptain({ selectedPlayer: selectedRow.Id })
            .then(result => {
                window.alert('CaptainAssignment= '+JSON.stringify(result));
                this.playerList = result;
            });

        this.showSuccessToast();
        window.location.reload();
    }

    showSuccessToast() {
        const event = new ShowToastEvent({
            title: 'Record updated',
            message: 'Captain has been assigned successfully',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

    navigateToPlayerRecordPage(rowData) {
        const player = rowData;

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: player.Id,
                actionName: 'view'
            }
        });
    }
}
