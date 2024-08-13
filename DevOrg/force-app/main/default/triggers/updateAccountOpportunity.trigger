trigger updateAccountOpportunity on Account (after update) {
  
Set<id> accId = new Set<id>();
for(Account acc: Trigger.new){
    accId.add(acc.id);
}
List<Opportunity> accOppList = [select id,Name, StageName, CreatedDate,CloseDate from Opportunity 
                                 where CreatedDate <= LAST_N_DAYS:30 AND StageName !='Closed Won' AND accountId IN :accId];
if(!accOppList.isEmpty()){
for(Opportunity opp: accOppList){
   opp.StageName = 'Closed Lost';
   opp.CloseDate=system.today();
}
}
update accOppList;
}