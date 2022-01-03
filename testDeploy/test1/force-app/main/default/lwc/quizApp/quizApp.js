/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-01-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';

export default class QuizApp extends LightningElement {

    selected = {}; // for storing answers

    myQuestions = [{

            id: "Questions1",
            questions: 'Which one of the following is not a template loop',
            answers: {
                a: 'for:each',
                b: 'iterator',
                c: 'map loop'
            },
            correctAnswer: 'a'
        },
        {
            id: "Questions2",
            questions: 'Which one of the file is invalid in LWC component folder',
            answers: {
                a: 'svg',
                b: 'apex',
                c: 'lwc'
            },
            correctAnswer: 'b'
        },
        {
            id: "Questions3",
            questions: 'Which one of the following is not a directive',
            answers: {
                a: '@track',
                b: '@api',
                c: 'aura'
            },
            correctAnswer: 'c'
        },
    ]
    get allNotSelected() {
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }
    changeHandler(event) {
        console.log('name', event.target.name);
        console.log('value', event.target.value);
        const {
            name,
            value
        } = event.target;
        //  const name = event.target.name;
        //  const name = 
        this.selected = {
            ...this.selected,
            ["Questions1"]: value
        };
        console.log('question 1 -------->'+ this.selected);
    }
    submitHandler(event) {
        event.preventDefault();
        this.myQuestions.filter(item=>this.selected["Questions1"]===item.correctAnswer);
        this.correctAnswer=correct.length;
        console.log("this.correctAnswer"+this.correctAnswer);

    }
    resetHandler() {
         this.selected();
         this.correctAnswer=0;


    }

}