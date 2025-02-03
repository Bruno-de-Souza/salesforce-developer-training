/**
 * @author bruno.moreira
 */
public class ParkLocator {
    
    public static String[] country(String countryName) {

        ParkService.ParksImplPort service = new ParkService.ParksImplPort();

        String[] availableParks = service.byCountry(countryName);

        return availableParks;

    }

}