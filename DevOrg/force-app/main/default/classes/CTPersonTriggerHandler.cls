public with sharing class CTPersonTriggerHandler {
    public static void beforeInsert(List<Person__c> newRecords){
        for(Person__c Persons : newRecords){
            Persons.Health_Status__c ='Green';
            Persons.Token__c = CTPersonController.gettoken(Persons.Mobile__c);
        }

    }
    public static void afterupdate(List<Person__c> newRecords, Map<id, Person__c>oldrecordMap){
        List<Person__c> PersonList = new List<Person__c>();
        for(Person__c personupdate : newRecords){
            if(personupdate.Health_Status__c!=oldrecordMap.get(personupdate.Id).Health_Status__c){
                Person__c newPerson = new Person__c(Id=personupdate.Id, Health_Status__c= personupdate.Health_Status__c,Status_Update_Date__c=system.today());
                PersonList.add(newPerson);
            }update PersonList;
        }
    }
}