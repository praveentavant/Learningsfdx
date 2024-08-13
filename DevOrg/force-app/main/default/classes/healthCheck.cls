public with sharing class healthCheck {
    public Integer recoveredInArea=0;
    public static Integer recoveredIncountry=0;
    public healthCheck(){
        system.debug('Constructor is called');
    }
    public healthCheck(Integer patientRecovered){
        recoveredInArea=patientRecovered;
        recoveredIncountry=patientRecovered;
    }
    public  void treatPatient() {
        recoveredInArea++;
        recoveredIncountry++;

    }
}