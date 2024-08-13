public class MinMaxSalarytriggerhelper {
    public static void trgMethod(List<Employee__c> emplist, Map<id,Employee__c>oldEmpMap){
        List<Employee__c> employeeList = new list<Employee__c>();
        List<Id> companyId = new List<id>();
        if(!emplist.isEmpty()){
            for(Employee__c emp : emplist){
                if(oldEmpMap!=null){
                    if(emp.company__c != oldEmpMap.get(emp.id).company__c){
                       
                        companyId.add(oldEmpMap.get(emp.id).company__c);
                        companyId.add(emp.company__c);
                    }
                    else{
                        companyId.add(emp.Company__c);
                    }
                }
                else{
                    companyId.add(emp.Company__c);
                }
                
            }
        }
        Map<id,Company__c> newMapCompany = new Map<id,Company__c>();
        List<AggregateResult> agResult = [Select Company__c cmId, MIN(Salary__c) minSalary, MAX(Salary__c) maxSalary FROM Employee__c where Company__c IN :  companyId GROUP BY Company__c ];
        for(AggregateResult ag :agResult){
            Company__c cmp = new Company__c();
            cmp.Id=(Id)ag.get('cmId');
            cmp.Maximum_Salary__c=(Decimal)ag.get('maxSalary');
            cmp.Minimum_Salary__c=(Decimal)ag.get('minSalary');
            newMapCompany.put(cmp.id,cmp);
        }
        if(!newMapCompany.isEmpty()){
            update newMapCompany.values();
        }
    }
    
}