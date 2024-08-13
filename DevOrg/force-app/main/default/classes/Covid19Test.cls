@isTest
private class Covid19Test {

    @isTest
    static void testConstructor() {
        Covid19 c = new Covid19();
        System.assertEquals(0, c.recoveredInArea);
        System.assertEquals(0, Covid19.recoveredInCountry);
    }

    @isTest
    static void testParameterizedConstructor() {
        Covid19 c = new Covid19(10);
        System.assertEquals(10, c.recoveredInArea);
        System.assertEquals(10, Covid19.recoveredInCountry);
    }

    @isTest
    static void testTreatPatient() {
        Covid19 c = new Covid19();
        c.treatPatient();
        System.assertEquals(1, c.getTreated());
        System.assertEquals(1, Covid19.recoveredInCountry);
    }

    @isTest
    static void testPrintTreated() {
        Test.startTest();
        Covid19.printTreated();
        Test.stopTest();
    }
}