public class Level_Underground implements GameLevel,ToughLevelGame {
    public void levelNumber(){   //implements keyword is being use to have the class GameLevel and all the gamelevel class 
        system.debug('level 1');// methods can be used.
    }
        public void environment(){
            system.debug('This level will be played underground');
            
        }
    public void toughLevel(){
        system.debug('this is being called to test multiple interface');
    }

    

}