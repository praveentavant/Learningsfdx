import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/ForEachDemoCompHelper.getAccounts';

const columns = [
    { label: 'Account ID', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating' }
];

export default class AccountTable extends LightningElement {
    @track accounts = [];
    @track columns = columns;
    @track isLoading = false;
    @track isLoadingMore = false;
    @track offset = 0;
    @track limitSize = 10;

    connectedCallback() {
        this.loadData();
    }

    loadData() {
        this.isLoading = true;
        getAccounts({ offset: this.offset, limitSize: this.limitSize })
            .then(result => {
                this.accounts = [...this.accounts, ...result];
                this.offset += this.limitSize;
                this.isLoading = false;
                this.isLoadingMore = false;
            })
            .catch(error => {
                this.error = error;
                this.isLoading = false;
                this.isLoadingMore = false;
            });
    }

    loadMoreData(event) {
        event.preventDefault();
        this.isLoadingMore = true;
        this.loadData();
    }
}