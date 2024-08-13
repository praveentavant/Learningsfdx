trigger opportunityStageChange on Opportunity (after update) {
   
       
        
        for(opportunity op : trigger.new){
            
            if(op.StageName=='closed won' && trigger.oldMap.get(op.Id).StageName!='closed won'){
                op.CloseDate=system.today();
                op.type='New Customer';
            }
    
        }
        }