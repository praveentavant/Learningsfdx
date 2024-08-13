public with sharing class ImperativeDataTableCotroller {
    @AuraEnabled
    public static List<Contact> imperativeDataTable(){
        try {
            List<Contact> conList = [SELECT id,Name,Email FROM Contact];
            return conList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
  
}