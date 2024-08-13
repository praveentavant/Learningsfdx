public class HelloWorld {
    private string Variable='This is the private variable';
    public string pubVar='This is the public variable';
    public void PrintGreeting(){
        system.debug(Variable);
    }
    public void Greeting(string greet){
        system.debug(greet);
    }
    public string getDay(integer dayNumber){
        string dayString='';
        switch on dayNumber{
            when 0 {
                dayString='Sunday';
                
            }
                when 1 {
                dayString='Monday';
                
            }
                when 2 {
                dayString='Tuesday';
                
            }
                when 3 {
                dayString='Wednesday';
                
            }
                when 4 {
                dayString='Thrusday';
                
            }
                when 5 {
                dayString='Friday';
                
            }
                when 6 {
                dayString='Saturday';
                
            }
            when else {dayString='invalid Day number';
                      }
            
        }
        return dayString;
    }
    
    

}