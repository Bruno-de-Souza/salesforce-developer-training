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
        
        System.debug( 'Status code: ' + response.getStatusCode() );
        
        System.debug( 'Status: ' + response.getStatus() );
        
        System.debug( 'Response Body: ' + response.getBody() );

        return GetAddressResponse.fromJson( response.getBody() );

    }

}