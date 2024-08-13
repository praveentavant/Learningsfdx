public with sharing class wireDataTablecontroller {
    @AuraEnabled(cacheable = true)
    public static List<Account> datatablecontroller(){
        try {
            List<Account> accList =[Select id,Name,Phone From Account];
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static List<Student__c> getStudents(){
        List<Student__c> students = [Select Id,Name From Student__c];
        return students;
    }
    
}