public with sharing class Fitness {
   Public static decimal CalculateBMI(Decimal weight,Decimal height){
    Decimal result=weight/(height*height);
    return result;
   }

   Public static Decimal CalculatePace(Decimal dist, Decimal min){
    Decimal hr = min/60;
    Decimal pace = dist/hr;
    return pace;
   }
}