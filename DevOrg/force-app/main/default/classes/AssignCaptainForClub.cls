public with sharing class AssignCaptainForClub {
    @AuraEnabled
    public static List<player__c> getPlayersList(Id selectedId){
        try {
            List<Player__c> playerList = [SELECT id, Name, Goal__c FROM player__c WHERE Football_Club__c = :selectedId];  
            if(!playerList.isEmpty()){
                return playerList;
            }  
            return null;
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static Boolean assignClubCaptain(id selectedPlayer){
        try {
            List<Football_Club__c> footballClub = new List<Football_Club__c>();
            List<player__c> captailPlayer = [SELECT ID, Name, Goal__c, Football_Club__c FROM player__c WHERE Id = :selectedPlayer ];
            system.debug('captailPlayer==> '+captailPlayer);
            for(player__c player : captailPlayer){
                Football_Club__c ftClub = new Football_Club__c();
                ftClub.Id = player.Football_Club__c;
                ftClub.captain__c = player.Id;
                footballClub.add(ftClub);
            }
            if(!footballClub.isEmpty()){
                upsert footballClub;
                return true;
            }
            return false;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
  
}