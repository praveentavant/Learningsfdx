public class LeadTriggerHandler {
    public static void beforeInsertHandler(List<Lead> newleadRecord){
        for(Lead leadList : newleadRecord){
        if(string.isblank(leadList.Rating)){
            leadList.Rating='Hot';
        }
                 //validation rule when industry is blank 
           if(string.isBlank(leadList.industry) ){
           leadList.addError('The Industry firld can not be Empty');
        }
     }
    }
    public static void beforeUpdateHandler(List<Lead> newleadRecord,map<Id, lead> oldmaprecords){
               for(Lead leadList : newleadRecord){
        if(string.isblank(leadList.Rating)){
            leadList.Rating='Hot';
        }			//validation rule for status conversion.
                   if((leadList.status == 'Closed - Converted' || leadList.status == 'Closed - Not Converted') && oldmaprecords.get(leadList.Id).status=='Open - Not Contacted'){
            leadList.status.addError('you can not convert any lead directly from open to closed');
            
        }
    }
        
    }
    public static void afterInsertHandler(List<Lead> newleadRecord){
               list<Task> leadListUpdate = new List<Task>();
            for(Lead leadList : newleadRecord){
                Task leadTask = new Task(Subject ='Send Quote',WhoId =leadList.Id );
                leadListUpdate.add(leadTask);
                
            }insert leadListUpdate;
        }
    }