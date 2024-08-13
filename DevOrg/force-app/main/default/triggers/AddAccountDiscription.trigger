trigger AddAccountDiscription on Account (after update) {
    
    
   Set<id> insertedAccount = new Set<Id>();
        for(account acc : trigger.new){
                 insertedAccount.add(acc.id);
            }

list<account> accChange = [SELECT id, Description From Account where id IN :insertedAccount];
    list<account> accToUpdate = new list<account>();
    system.debug(accChange);
    
    
    
       
for(account acc : accChange){
    
    
        system.debug(acc);
    acc.Description = 'updated via trigger';
    accToUpdate.add(acc);
    system.debug(accToUpdate);
      
}
    boolean flag = true;
    if(flag = true){ 
        system.debug(flag);
        
           
        update accToUpdate;
            
    system.debug(accToUpdate);
        
    
        flag=false;
        system.debug(flag);
        }
}