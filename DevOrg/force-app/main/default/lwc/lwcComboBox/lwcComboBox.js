import { LightningElement,track,api } from 'lwc';
import getAccountList from '@salesforce/apex/AccountHandler.getAccountList';
import returnContact from '@salesforce/apex/AccountHandler.returnContact';

const columns=[
    {label : 'Contact Name', fieldName: 'Name'},
    {label :'Contact Number', fieldName: 'Phone'},
];
export default class LwcComboBox extends LightningElement {
    @track value = '';
    @track accoptions = [];
    @track contactTable = false;
    @track columns = columns;
    @track data= [];
    @api recordId;

    get options(){
        return this.accoptions;
    }
    connectedCallback(){
        getAccountList()
            .then(result => {
                console.log('inside getAccounts');
                console.log('results==> '+result);
                let arr = [];
                for( var i=0; i<result.length; i++){
                    arr.push({label:result[i].Name, value:result[i].Id});
                    console.log('arr==+'+arr);
                }
                this.accoptions=arr;
                console.log('accoptions==+'+JSON.stringify(this.accoptions,null,2));

            })
        
    }
    

    onchangeHandler(event){
        this.value = event.detail.value;
        this.contactTable = true;
        window.alert('refreshed 3');
        window.alert('Selected Records is : '+JSON.stringify(this.value));
        window.alert('recordId==>'+this.recordId);
        returnContact({accountId : this.value})
        .then(result => {
            this.data = result;
        })
    }
  

}