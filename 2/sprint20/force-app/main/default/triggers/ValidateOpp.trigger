trigger ValidateOpp on Opportunity (before insert) {
    for(Opportunity opp :trigger.new){
        if(opp.amount < 10000){
            opp.addError('please enter opp amount more than 50000');
        }        
    }
}