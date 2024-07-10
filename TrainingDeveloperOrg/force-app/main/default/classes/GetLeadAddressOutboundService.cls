/**
 * @author bruno.moreira
 */
public class GetLeadAddressOutboundService {

    GetAddressOutboundService outboundService;
    
    public GetLeadAddressOutboundService() {
        outboundService = new GetAddressOutboundService();
    }

    public Lead findAddressByZipCode(Id leadId, String zipCode) {

        GetAddressResponse address = outboundService.getAddress(zipCode);

        return new Lead (
            Id = leadId,
            Street = Address.logradouro,
            City = Address.localidade,
            State = Address.uf,
            PostalCode = Address.cep
        );

    }


}