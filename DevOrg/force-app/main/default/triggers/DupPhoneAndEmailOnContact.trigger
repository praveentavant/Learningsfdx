trigger DupPhoneAndEmailOnContact on contact (before insert,before update) {
    Map<string,Contact> emailMap = new Map<string,Contact>();
    Map<string,Contact> phoneMap = new Map<string,Contact>();
    if(trigger.isBefore && trigger.isInsert){
        if(!trigger.new.isEmpty()){
            for(contact cont : trigger.new){
                emailMap.put(cont.Email,cont);
                phoneMap.put(cont.Phone,cont);
            }
        }
    }
    if(trigger.isBefore && trigger.isUpdate){
        if(!trigger.new.isEmpty()){
            for(contact con : trigger.new){
                if(trigger.oldMap.get(con.Id).Email != con.Email){
                    emailMap.put(con.Email,con);                    
                } 
                if(trigger.oldMap.get(con.Id).Phone != con.Phone){
                    phoneMap.put(con.Phone,con);
                }
            }
            
        }
    }
    string errorMsz = '';
    List<contact> ExistingConList = [SELECT id,Email,Phone from Contact 
                                     where email IN : emailMap.keySet() 
                                     or Phone IN :phoneMap.keyset() ];
    if(!ExistingConList.isEmpty()){
        for(contact con : ExistingConList ){
            if(con.Email!= null ){
                if(emailMap.get(con.Email)!= null){
                    errorMsz = 'Email';
                }
                if(con.Phone != null){
                     if(phoneMap.get(con.Phone)!= null){
                    errorMsz = errorMsz +(errorMsz!=''? ' and Phone' : 'Phone');
                    system.debug('error message =='+errorMsz);
                }
                }
               
            }
            
        }
    }
    if(trigger.new != null){
        for(contact contactst : trigger.new){
            if(errorMsz != ''){
                contactst.addError('you have duplicte ' +errorMsz+ ' in your org ');
            }
        } 
    }
    
    
    
    
    
}