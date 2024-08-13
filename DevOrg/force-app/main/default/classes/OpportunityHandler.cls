public class OpportunityHandler {
    public static void UpdateProfile(Set<Id> OppId){
       List<Opportunity> oppList = [SELECT id,Amount,Profile__c from opportunity where id=:OppId];
        
        for(Opportunity op : oppList){
            if(op.Amount == null){
                op.Profile__c ='';
            }
           
             else if(op.Amount>100000){
                op.Profile__c='Low';
            }else if(op.Amount>500000){
                op.Profile__c='High';
            }else {
                op.Profile__c='Medium';
            }
        }update oppList;
        }
       
    

}