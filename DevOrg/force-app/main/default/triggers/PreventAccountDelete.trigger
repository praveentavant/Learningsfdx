trigger PreventAccountDelete on Account (before Delete) {
    if(trigger.isBefore && trigger.isDelete){
        List<Account> accDelete = New List<Account>();
        if(!trigger.old.isEmpty()){
            for(Account ac: Trigger.old){
                if(ac.Active__c=='Yes'){
                    ac.addError('You can not Delete the active account');
                }
              
            } 
        }
    }

}