/**
 * @author bruno.moreira
 */
public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id) {

        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        String stringResponse = '';

        System.debug('****** Status Code: ' + response.getStatusCode());
        System.debug('****** Body Response: ' + response.getBody());

        if(response.getStatusCode() == 200) {

            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());

            Map<String,Object> animals = (Map<String,Object>) results.get('animal');

            System.debug('Received the following Animals: ' + animals);

            stringResponse = String.valueOf(animals.get('name'));

            System.debug('****** Animals Name: ' + stringResponse);

        }

        return stringResponse;

    }

}