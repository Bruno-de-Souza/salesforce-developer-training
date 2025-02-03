/**
 * @author bruno.moreira
 */
@isTest
public class ParkLocatorTest {
    
    @isTest
    public static void parkLocatorTest() {

        test.setMock(WebServiceMock.class, new ParkServiceMock());

        String[] parks = ParkLocator.country('Brazil');

        System.assertEquals('Park1', parks[0]);

    }   

}