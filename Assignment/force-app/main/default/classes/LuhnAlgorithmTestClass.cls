@isTest
public class LuhnAlgorithmTestClass {
    
    
    @IsTest
    public static void testCheckNumberAndMonth() {
        System.assert(LuhnAlgorithm.checkNumberAndMonth('1234567890123', 13));
    }

    @isTest
    public static void testCalculateLuhnChecksum() {
        System.assertNotEquals(0, LuhnAlgorithm.calculateLuhnChecksum('1234567890129'));
    }

    @isTest
    public static void subStrintMethodd() {
        String input = '1901020347382';
        System.assertEquals(input, LuhnAlgorithm.subStringMethod(input));
            }

}