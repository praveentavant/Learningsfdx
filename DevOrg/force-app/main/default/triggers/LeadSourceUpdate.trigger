trigger LeadSourceUpdate on Lead (after update) {
    set<Id> leadIds = New Set<Id>();
     for(lead ld : trigger.new){
       leadIds.add(ld.Id);
    }
    
    List<Lead> LeadListToUpdateSource = [SELECT Id,LeadSource FROM Lead WHERE Id IN :leadIds ];
    
    List<Lead> listToUpdate = new List<Lead>();
    boolean flag = false;
    for(Lead Leads : LeadListToUpdateSource ){
        if(flag=false){
        flag =true;
        Leads.LeadSource ='Other';
        listToUpdate.add(Leads);
        }
    }
    if(!listToUpdate.isEmpty()){
     update listToUpdate;
    }
 }