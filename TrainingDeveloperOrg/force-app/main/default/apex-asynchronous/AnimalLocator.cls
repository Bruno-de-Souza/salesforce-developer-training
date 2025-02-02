/**
 * @author bruno.moreira
 */
public class AnimalLocator {
    
    public static HttpResponse getAnimalNameById() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('Get');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {

            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());

            List<SObject> names = (List<Account>) results.get('names');

            System.debug('Received the following animals name:');

            for (Object name: names) {
                
                System.debug(name);

            }

        }

        return response;

    }

}