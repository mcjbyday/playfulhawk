public class StringArrayTest {
	
    public static List<String> generateStringArray(Integer n) {
        
        List<String> myCounterArray = new List<String>();

        
        if (n < 0) {
            System.debug('Please enter a non-negative value');
            myCounterArray.add('Array not valid');
        }
        else {        
        
        for(Integer i=0;i<n;i++) 
        	{
                myCounterArray.add('Test '+i);
                System.debug(myCounterArray[i]);
            }
         }
    
        return myCounterArray;
    }
}