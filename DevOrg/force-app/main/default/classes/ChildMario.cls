public class ChildMario extends Mario {
    public override void ability(){  // to override or modify any changes on the existing methods of parent class override
        system.debug('Hello I am overriden');// keyword is used.
        super.ability(); // to call any of the parent method from the child class have to use super keyword. 
    }

}

/*Mario chl = New Mario();
chl.ability();
chl.info();
chl = New ChildMario();
chl.ability(); this is called polimorphic reference. 
chl.info();
*/