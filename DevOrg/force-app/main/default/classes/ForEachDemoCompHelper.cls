public with sharing class ForEachDemoCompHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer offset, Integer limitSize) {
        return [
            SELECT Id, Name, Rating
            FROM Account
            ORDER BY Name
            LIMIT :limitSize
            OFFSET :offset
        ];
    }
}