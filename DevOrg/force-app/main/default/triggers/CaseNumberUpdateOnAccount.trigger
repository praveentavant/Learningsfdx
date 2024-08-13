trigger CaseNumberUpdateOnAccount on case (after insert,after update) {
    CaseNumberUpdateOnAccount_Handler.UpdateCaseNumber(trigger.new);

}