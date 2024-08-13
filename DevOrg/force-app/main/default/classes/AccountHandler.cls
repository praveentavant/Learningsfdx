public class AccountHandler {
    public static List<Account> insertAccounts(List<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }
    public static Account InsertAccount(Account insertSingleAccount){
        insert insertSingleAccount;
        return insertSingleAccount;
    }
    
    public static List<Account> getAllAccounts(){
        //retrieve all account and assign it in a list collection
        List<Account> acclist =[SELECT id,Name from Account];
        Return acclist;
    }
    public static void PrintAllAccounts(){
        //retrieve all account and assign it in a list collection
        List<Account> acclist =[SELECT id,Name from Account];
        for(Account ac :acclist){
            system.debug('Name :'+ac.Name+ 'Phone :'+ac.Phone+ 'Rating :'+ac.Rating);
        }
        }
    public static Integer  GetAccountsSize(){
        List<Account> acc = getAllAccounts();
        return acc.size();
    }
    
    public static void updateAvgCaseResolutionDays(List<Id> AccountId){
        map<id,Integer> accountTotalCaseMap = new map<Id,Integer>();
        map<id,Integer> accountTotalCaseDaysMap = new map<Id,Integer>();
        
        List<Case> CaseLists = [SELECT id,createdDate, AccountId,ClosedDate FROM Case WHERE isClosed=true AND AccountId IN:AccountId];
        For(Case caseList :CaseLists ){
            if(!accountTotalCaseMap.containsKey(caseList.AccountId)){
                accountTotalCaseMap.put(caseList.AccountId,0);
                accountTotalCaseDaysMap.put(caseList.AccountId,0);
    	 		}
           Integer totalCases = accountTotalCaseMap.get(caseList.AccountId);
            totalCases++;
           accountTotalCaseMap.put(caseList.AccountId,totalCases);
            Integer totalDays = accountTotalCaseDaysMap.get(caseList.AccountId);
            
            totalDays+=caseList.CreatedDate.date().daysBetween(caseList.ClosedDate.date());
            
            accountTotalCaseDaysMap.put(caseList.AccountId,totalDays);
           
        }
        List<Account> Accounts = New List<Account>();
         
        for(id AccountIdToUpdate : accountTotalCaseMap.keyset() ){
            Decimal resolutionDays = accountTotalCaseDaysMap.get(AccountIdToUpdate)/accountTotalCaseMap.get(AccountIdToUpdate);
            Accounts.add(new Account (id =AccountIdToUpdate, Avg_Case_Resolution_Days__c=resolutionDays ));
        }Update Accounts;
            
     
    }

    @AuraEnabled
    public static List<Account> getAccountList(){
        
            List<Account> accList = [SELECT id,Name FROM Account limit 10];
            system.debug('accList==> '+accList);
            return accList;
        
    }

    @AuraEnabled
    public static List<contact> returnContact(Id accountId){
        try {
            List<contact> conList = [SELECT id,Name,Phone From Contact WHERE AccountId = : accountId];
            system.debug('conList==> '+conList);
                return conList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
       

}