import { LightningElement } from 'lwc';

export default class ParentCoponent extends LightningElement {
    carausalData=[
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header : "First Card",
            description : "First card description."
           
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header : "secound Card",
            description : "secound card description."
           
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header : "third Card",
            description : "Third card description."
           
        }
    ]

    percentage=20
    changehandler(event){
        this.percentage=event.target.value
    }
    handleClick(){
        this.template.querySelector('c-p2c-slider-component').resethandler();
    }
    
}