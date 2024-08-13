trigger CloseOppStageOnAccountUpdate on Account (After update) {
    Set<id> accIds = new set<Id>();
    for(Account acc: trigger.new){
        accIds.add(acc.Id);
    }
    List<Opportunity> updatedOpList = new List<Opportunity>();
    List<Opportunity> oppList = [select id,StageName from Opportunity where AccountId IN : accIds];
    for(Opportunity op: oppList){
        
       
        op.StageName='Closed Lost';
        updatedOpList.add(op);
    }update updatedOpList;

}