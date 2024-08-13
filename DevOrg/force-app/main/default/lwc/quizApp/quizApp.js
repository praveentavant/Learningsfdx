import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {
    selected={} //for storing answer
    correctAnswers=0 //for measuring correct answers
    isSubmitted=false // to display to correct answers 
    get isScoredFull(){
        return `slds-text-heading_large ${this.MyQuestions.length===this.correctAnswers? 'slds-text-color_success':'slds-text-color_error'}`

    }
    MyQuestions=[
        {
            id:"Question1",
            question :"Which one of the following is not the template loop ?",
            Answer:{
                a:"For:each",
                b: "iterator",
                c: "map loop"
            },
            correctAnswer:"c"
        },
            {
                id:"Question2",
                question :"Which one of the following is invalid in LWC component folder ?",
                Answer:{
                    a:".svg",
                    b: ".apex",
                    c: ".js"
                },
                correctAnswer:"b"
            },
                {
                    id:"Question3",
                    question :"Which one of the following is not the Directive ?",
                    Answer:{
                        a:"For:each",
                        b: "iterator",
                        c: "@track"
                    },
                    correctAnswer:"c"
                
            
        }
    ]
    get AllnotSelected(){
        return !(Object.keys(this.selected).length===this.MyQuestions.length)
    }

    changeHandler(event){
        console.log("Name is ",event.target.name)
        console.log("Value is ",event.target.value)
        const{name,value}=event.target
        this.selected={...this.selected,[name]:value}

    }
    submitHandler(event){
        event.preventDefault()
        let correct=this.MyQuestions.filter(item=>this.selected[item.id]===item.correctAnswer)
        this.correctAnswers=correct.length
        this.isSubmitted=true
        console.log("correctAnswers length",this.correctAnswers)

    }
    resetHandler(){
        this.selected={}
        this.correctAnswers=0
        

    }
}