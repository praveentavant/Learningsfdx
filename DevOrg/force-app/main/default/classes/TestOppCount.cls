public class TestOppCount {
 public static void main(List<Account> acco ){
List<Account> accList =  new List<Account>();
for(Account acc : [select id , OpportunityCount__c, (select id from Opportunities) from account where id in :acco]){
acc.OpportunityCount__c = acc.Opportunities.size();
accList.add(acc);
}
update accList;
}

    

}