trigger NumberOfStudentOnClass on Student__c (after insert, after update, after delete, after undelete) { 
   Set<Id> ClassIds = new Set<Id>();
   
   if(trigger.isInsert || trigger.isUndelete){
    for(Student__c cls : trigger.new){
        if(trigger.new!=null){
            ClassIds.add(cls.class__c);
        }
    }
   }
   if(trigger.isUpdate){
    for(student__c cls : trigger.new){
        if(cls.class__c!=trigger.oldMap.get(cls.id).Class__c){
            if(trigger.oldMap.get(cls.id)!=null){
                ClassIds.add(trigger.oldMap.get(cls.id).Class__c);
            }
            if(cls.class__c!=null){
                ClassIds.add(cls.class__c);
            }
        }
    }
   }
   if(trigger.isDelete){
     if(trigger.old!=null) {
        for (Student__C stu  : trigger.old) {
            ClassIds.add(stu.class__c);
        }

    
  }
   }


   Map<Id,Integer> ClassMap = new Map<Id,Integer>();
   List<AggregateResult> results = [SELECT COUNT(Id)Students,Class__c FROM Student__c WHERE Class__c IN :ClassIds GROUP BY Class__c ];
   for(AggregateResult result :results ){
    string ClassIds = (String)result.get('Class__c');
    Integer StudentCount = (Integer)result.get('Students');
    ClassMap.put(ClassIds, StudentCount);
   }
   List<Class__c> classList = [SELECT id,Number_of_student__c FROM class__c where id IN :ClassIds];
   if(classList.size()>0){
   for(Class__c classToUpdate : classList){
         if(ClassMap.containsKey(classToUpdate.id)) {
            classToUpdate.Number_of_student__c = ClassMap.get(classToUpdate.Id);
        }
    else {
        classToUpdate.Number_of_student__c=null;
    }
   }

    } update classList;
}