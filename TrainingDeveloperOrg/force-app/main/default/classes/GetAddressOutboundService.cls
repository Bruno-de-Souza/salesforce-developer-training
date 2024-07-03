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
        
        System.debug( response.getStatusCode() );
        
        System.debug( response.getStatus() );
        
        System.debug( response.getBody() );

        return GetAddressResponse.fromJson( response.getBody() );

    }

}