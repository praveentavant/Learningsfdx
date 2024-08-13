//whenever account is created related contact will be aoutomatically created.

trigger AccountToContactCreate on Account (after insert) {
    List<Contact> contactList = new List<Contact>();
    for(Account Acc : trigger.new){
        if(Acc.Contacts.isEmpty()){
            Contact con = new Contact(LastName=Acc.Name,AccountId=Acc.Id);
            contactList.add(con);
        }
    }
    if(!contactList.isEmpty()){
        Insert contactList;
    }

}