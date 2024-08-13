public class Covid19 {
    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;

    // blank constructor
    public Covid19(){
        System.debug('Constructor Called');
    }

    // parameterized constructor to set class variables value
    public Covid19(Integer recoveredInArea){
        // calling blank constructor
        this();
        // use this keyword to refer to global variables
        this.recoveredInArea = recoveredInArea;
        recoveredInCountry = recoveredInArea;
    }

    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }
    public integer getTreated(){
    	return recoveredInArea;
    }

    public static void printTreated(){
        System.debug('Recovered in country : '+recoveredInCountry);
    }
}