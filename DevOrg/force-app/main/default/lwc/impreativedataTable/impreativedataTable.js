import { LightningElement ,track,wire} from 'lwc';
import imperativeDataTable from '@salesforce/apex/ImperativeDataTableCotroller.imperativeDataTable';
const coloumns = [
    {label : 'Contact Name', fieldName:'Name'},
    {label : 'Contact Email', fieldName : 'Email'},
];

export default class ImpreativedataTable extends LightningElement {
    @track columns =coloumns;
    @track data =[];

    connectedCallback(){
        imperativeDataTable()
        .then(result =>{
            this.data = result;
        })
        .catch(error =>{
            console.log('Error occored');
        })
    }


}