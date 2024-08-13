@istest
public with sharing class TestFitness {
    @istest
    public static void testCalculateBmi() {
        Fitness.CalculateBMI(60,5);
        system.assertEquals(2.4,  Fitness.CalculateBMI(60,5),'BMI should be 12 for weight 60 and height 5');

    }
    @istest
    public static void testCalculatePace(){
        Fitness.CalculatePace(100,20);
    }
}