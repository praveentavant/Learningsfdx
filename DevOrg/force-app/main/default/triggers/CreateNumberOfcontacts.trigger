trigger CreateNumberOfcontacts on Account (After insert) {
   List<contact> conList = new List<Contact>();
   Map<Id,Decimal> contactCountMap = new Map<Id,Decimal>();
   for(Account Acc : trigger.new){
     contactCountMap.put(Acc.id,Acc.Active_Contacts__c);
   }

     if(contactCountMap.size()!=0 && contactCountMap.size()>0){
        for(id AccId : contactCountMap.keySet()){
            for(Integer i=1;i<contactCountMap.get(AccId);i++){
                Contact con = new Contact(LastName='test'+i,AccountId=AccId);
                conList.add(con);
            }
        }
     }
   if(!conList.isEmpty()){
    insert conList;
   }
}