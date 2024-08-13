public class ActiveContactsOnAccount {
    public static List<Account> showActiveContact(list<Account> AccountList){
        List<Account> conlist = new List<Account>();
        Boolean flag = false;
        if(flag=false){
        for(Account acc : [select id,Active_Contacts__c,(select id,Name from contacts) from Account where id in :AccountList]){
            acc.Active_Contacts__c = acc.contacts.Size();
            conlist.add(acc);
        }update conlist;
        
            flag = true;
        
                } return conlist; 
    }
    

}