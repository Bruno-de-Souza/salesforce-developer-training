/**
 * @author bruno.moreira
 */
public with sharing class GetAddressOutboundService {
    
    public GetAddressOutboundService() {
    }

    public GetAddressResponse getAddress (String zipCode) {

        HttpRequest request = new HttpRequest();        

        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json/');

        request.setMethod('GET');

        request.setHeader('Content-Type', 'application/json');

        Http http = new Http();

        HttpResponse response = http.send(request);

        //200 - 299 (Sucesso)
        //300 -399 (Redirecionamento)
        //400 - 499 (Erro no processamento da request)
        //>= 500 - (Erro no servidor)

        if (response.getStatusCode() != 200) {
            throw new GetAddressOutboundServiceException( 'Status throw error: ' + response.getStatus() );
        }
        
        System.debug( 'Status code: ' + response.getStatusCode() );
        System.debug( 'Status: ' + response.getStatus() );
        System.debug( 'Response Body: ' + response.getBody() );

        return GetAddressResponse.fromJson( response.getBody() );

    }

    public class GetAddressOutboundServiceException extends Exception {}

}