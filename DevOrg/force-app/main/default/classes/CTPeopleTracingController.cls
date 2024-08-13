public with sharing class CTPeopleTracingController {
    public static List<People_Tracing__c> getTraces(string recordId){
       return [SELECT Name, Id, Contact_Date__c, Contact_Type__c, Person_1__c,Person_1__r.Health_status__c,Person_1__r.token__c,
        Person_2__c,Person_2__r.Health_status__c,Person_2__r.Token__c
        FROM People_Tracing__c
         WHERE Person_1__c =:recordId 
         OR person_2__c = :recordId 
         ORDER BY Contact_Date__c DESC];
    }
    public static List<People_Tracing__c>checkDuplicates(List<People_Tracing__c>newPeopleTraces){
        //store unique personIds
        Set<Id> personIds = new Set<Id>();
        for(People_Tracing__c traces :newPeopleTraces ){
            personIds.add(traces.Person_1__c);
            personIds.add(traces.Person_2__c);
        }
        //list of duplicates records
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();

        //map of id and setof ids to check the duplicates persons
        Map<id,Set<Id>> mapOfExistingRecords = new  Map<id,Set<Id>>();

        //list of people tracing id what we are getting from the new list that is being passed from the arguments

        List<People_Tracing__c> existingRecords = [SELECT Id,Person_1__c,person_2__c FROM People_Tracing__c
                                                    WHERE Person_1__c IN :personIds
                                                    OR person_2__c IN : personIds ];
        // check whether the list have any value or not : 

        if(existingRecords!=null && existingRecords.size()>0){
            for(People_Tracing__c traces :existingRecords ){
                if(! mapOfExistingRecords.containsKey(traces.Person_1__c)){
                    mapOfExistingRecords.put(traces.Person_1__c, new set<id>());
                }
                mapOfExistingRecords.get(traces.Person_1__c).add(traces.Person_2__c);

                //build map for person_2
                if(! mapOfExistingRecords.containsKey(traces.Person_2__c)){
                    mapOfExistingRecords.put(traces.Person_2__c, new set<id>());
                }
                mapOfExistingRecords.get(traces.Person_2__c).add(traces.Person_1__c);
            }

            for(People_Tracing__c trace : newPeopleTraces){
              if( (mapOfExistingRecords.containsKey(trace.Person_1__c) && mapOfExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c))
                || (mapOfExistingRecords.containsKey(trace.Person_2__c) && mapOfExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c))
              ) {
                duplicates.add(trace);
              }
            }
        } 
        return duplicates;
    }


}