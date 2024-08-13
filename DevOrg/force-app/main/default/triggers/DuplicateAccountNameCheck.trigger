trigger DuplicateAccountNameCheck on Account (before insert, before update) {
    Set<String> accountNames = new Set<String>();
    Set<Id> accountIdsToUpdate = new Set<Id>();

    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        for (Account acc : Trigger.new) {
            accountNames.add(acc.Name);
        }

        if (Trigger.isUpdate) {
            for (Account acc : [SELECT Id, Name FROM Account WHERE Id IN :Trigger.new AND Name IN :accountNames]) {
                accountIdsToUpdate.add(acc.Id);
            }
        }
    }

    List<Account> existingAccounts = [SELECT Id, Name FROM Account WHERE Name IN :accountNames AND Id NOT IN :accountIdsToUpdate];
    Map<String, Account> mapNameToAccount = new Map<String, Account>();

    for (Account existingAccount : existingAccounts) {
        mapNameToAccount.put(existingAccount.Name, existingAccount);
    }

    for (Account newAccount : Trigger.new) {
        if (mapNameToAccount.containsKey(newAccount.Name) && !accountIdsToUpdate.contains(newAccount.Id)) {
            newAccount.addError('This is already an existing Account name, please try with some other name');
        }
    }
}