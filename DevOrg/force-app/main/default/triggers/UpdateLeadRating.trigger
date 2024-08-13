trigger UpdateLeadRating on Lead (before insert) {
    for(Lead ld : trigger.new){
        if(ld.LeadSource=='Web'){
            ld.Rating='Cold';
        } else {
            ld.Rating='Hot';
        }
    }

}