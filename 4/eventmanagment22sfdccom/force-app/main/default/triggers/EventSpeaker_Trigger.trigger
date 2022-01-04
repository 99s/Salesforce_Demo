trigger EventSpeaker_Trigger on EventSpeakers__c (before insert,before update) {
    
          // get the speaker id and event id
          // soql on event to get the start date and put into a map
          // soql on event speaker to get the related speaker along with the event start date
          // check the condition and show the error
          
          // get the speaker id and event id start
          set<id> speakeridset = new set<id>();
          set<id> eventidset = new set<id>();
    
          for(EventSpeakers__c es: trigger.new){
                speakeridset.add(es.Speaker__c);
                eventidset.add(es.Event__c);                        
    }
    
    // step 1 - get the speaker id and event id end
    
    // step 2 start
    Map<Id,DateTime> requestedEvents = new Map<Id,DateTime>();
    
    List<Event__c> relatedEventList = [select Id,Start_DateTime__c from Event__c Where Id IN : eventidset];
    
    for(Event__c evt : relatedEventList){
        requestedEvents.put(evt.Id,evt.Start_DateTime__c);        
    }
    
    // step 3-start
    List<EventSpeakers__c> relatedEventSpeakerList = [Select Id,
                                                     Event__c,
                                                     Speaker__c,Event__r.Start_DateTime__c 
                                                     from EventSpeakers__c 
                                                     Where Speaker__c IN:speakeridset];
    
    // step 4
    for(EventSpeakers__c es: Trigger.New){
        
        DateTime bookingTime = requestedEvents.get(es.Event__c);
        // DateTime for that Event Which is associated with this new Event-Speaker Record
        for(EventSpeakers__c esl :relatedEventSpeakerList ){
            if(esl.Speaker__c == es.Speaker__c && esl.Event__r.Start_DateTime__c == bookingTime){
                es.Speaker__c.addError('The Speaker is Already Booked at that Time');
                                
            }            
        }                     
    }    
}