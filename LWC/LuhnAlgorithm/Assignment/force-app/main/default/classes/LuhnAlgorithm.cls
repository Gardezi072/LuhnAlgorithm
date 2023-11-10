    public class LuhnAlgorithm {
        
        public static Boolean validNumber = false;

        public static Boolean checkNumberAndMonth(String IdNumber, Integer months){

            If(IdNumber !=null && idNumber.length()==13){
                return true;
            }
            If(months>=12){
                return true;
            }else{
                return false;
            }
        }
        @AuraEnabled
        public static Integer calculateLuhnChecksum(String input) {
            
                Integer sum = 0;
                Boolean doubleDigit = false;
                
                for (Integer i = input.length() - 1; i >= 0; i--) {
                    Integer digit = Integer.valueOf(input.substring(i, i + 1));
                    
                    if (doubleDigit) {
                        digit *= 2;
                        if (digit > 9) {
                            digit -= 9;
                        }
                    }
                    
                    sum += digit;
                    doubleDigit = !doubleDigit;
                }
                
                // Return the checksum (the next highest multiple of 10)
                Integer remainder = Math.mod(sum,10);
                if (remainder == 0) {
                    validNumber = true;
                    return 0;
                }
                validNumber = false;
                return 10 - remainder;
            }
            
    
    
        public static String subStringMethod(string sub){

            Integer Year=Integer.valueOf('19' + sub.substring(0,1));
            Integer Month=Integer.valueOf(sub.substring(2,3));
            Integer Day=Integer.valueOf(sub.substring(4,5));
            Integer SSSS=Integer.valueOf(sub.substring(6,9));
            Integer CAZ=Integer.ValueOf(sub.substring(10,12)); 

            return sub;
        }
        
    }
            
            
    