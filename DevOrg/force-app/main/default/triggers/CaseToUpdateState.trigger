// Trigger on case to update status and priority if origin is Email 
trigger CaseToUpdateState on Case (before insert) {
   
   for(case newCase : trigger.new){
    if(newCase.Origin=='Email'){
       
        newCase.Status='New';
        newCase.Priority='Medium';
        
    }
   }

}