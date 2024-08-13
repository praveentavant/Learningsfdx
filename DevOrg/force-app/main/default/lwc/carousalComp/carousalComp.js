import Description from '@salesforce/schema/Account.Description';
import { LightningElement } from 'lwc';
import StaticPics from '@salesforce/resourceUrl/StaticPics';

export default class CarousalComp extends LightningElement {

    players =[
        {
            id:"1",
            header:"Muhammad Ali",
            src: StaticPics + '/StaticPics/Muhammad_Ali.jpg',
            href:"https://en.wikipedia.org/wiki/Muhammad_Ali",
            description:"Greatest Boxer of all time"
        },
        {
            id:"2",
            header:"Rocky Marciano",
            src: StaticPics + '/StaticPics/Rocky_Marciano.jpg',
            href:"https://en.wikipedia.org/wiki/Rocky_Marciano",
            description:"Rocky Marciano 2nd desdliest fighter"
        },
        {
            id:"3",
            header:"Mike Tyson",
            src:StaticPics + '/StaticPics/Mike_Tyson.jpg',
            href:"https://en.wikipedia.org/wiki/Mike_Tyson",
            description:"Mike_Tyson"
        },
    ]
}