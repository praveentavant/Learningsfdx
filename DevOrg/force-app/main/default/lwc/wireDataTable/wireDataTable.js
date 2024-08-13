import { LightningElement,track,wire } from 'lwc';
import datatablecontroller from '@salesforce/apex/wireDataTablecontroller.datatablecontroller';
const columns=[
    {label : 'Name', fieldName: 'Name'},
    {label :'Phone Number', fieldName: 'Phone'},
];
export default class WireDataTable extends LightningElement {
    @track columns = columns;
    @track data= [];

    @wire(datatablecontroller)
    datacontroller({data,error}){
        if(data){
            this.data = data;
        }
        else if(error){
            console.log('Error occured')
        }
    }
}