trigger ContactToAccountdescription on Contact (after update) {
    Map<id,contact> conMap = new Map<id,Contact>();
	List<Account> AccountsUpdate = new List<Account>();
	if(Trigger.isAfter && Trigger.isUpdate){
		
		for(Contact con : trigger.new){
			if(Trigger.oldMap.get(con.id).description!=con.description){
				conMap.put(con.AccountId,con);
			}
		}
		list<Account> accList = [SELECT id,Description from Account where id IN :conMap.keyset()];
		for(Account acc: accList){
			acc.description=conMap.get(acc.Id).description;
			AccountsUpdate.add(acc);
		}
		update AccountsUpdate;
	}

}