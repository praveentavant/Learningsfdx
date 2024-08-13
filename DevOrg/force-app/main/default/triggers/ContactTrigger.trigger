trigger ContactTrigger on Contact (After insert,after update,after delete,after undelete) {
    switch on Trigger.OperationType {
        when AFTER_INSERT {
            ContactTriggerhandler.AfterInsertContact(trigger.new);
                }
                When AFTER_UPDATE{
                    ContactTriggerhandler.afterUpdateContact(Trigger.new, trigger.oldMap);
                }
                when AFTER_DELETE{
                    ContactTriggerhandler.AfterInsertContact(trigger.old);
                }
                when AFTER_UNDELETE{
                    ContactTriggerhandler.AfterInsertContact(trigger.new);
                }
        }
       
    }