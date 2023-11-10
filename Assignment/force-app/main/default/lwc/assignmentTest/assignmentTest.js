import { LightningElement, track, wire } from 'lwc';
import calculateLuhnChecksum from '@salesforce/apex/LuhnAlgorithm.calculateLuhnChecksum';
import getHolidays from '@salesforce/apex/CalenderificHolidayAPI.getHolidays';
import getValidValues from '@salesforce/apex/ValidNumbers.getValidValues';




export default class AssignmentTest extends LightningElement {

    holidayColumns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Date', fieldName: 'Date__c' },
      
    ];

   


    @track inputText;
    @track isSearchDisabled =true;
    checksumValid;
    checksumNotValid;
    showResult =false;
    holidays = [];
    identificationNumbers = [];
    Valid_ID_s__c;


    // @wire(calculateLuhnChecksum)
    // checksum;

    handleIdChange(event){
        this.showResult = false;
        this.inputText= event.target.value;
        this.isSearchDisabled= !this.inputText;
       
    }

    handleClick(event) {
        calculateLuhnChecksum({input: this.inputText})
        .then(result => {
            this.showResult = true;
            console.log(result);
            this.checksumValid = result == 0;
            if (this.checksumValid) {
                getHolidays({year: '20' + this.inputText.substring(0,2)})
                .then(holidays => {
                    this.holidays = holidays;

                    console.log(this.holidays);
                });
            }
        });
    }
    handleSave(event){
        calculateLuhnChecksum({input: this.inputText})
        .then(result => {
            console.log(result);
            this.checksumValid = result == 0;
            this.checksumNotValid= result !=0;

            if (this.checksumValid) {
                getValidValues({inputNumber: this.inputText})
                .then(result=>{
                        this.identificationNumbers = result;
                });
            }else if(this.checksumNotValid)
            {
                alert('Please Input Valid Number');
            }
            
        });
        
            }

}





