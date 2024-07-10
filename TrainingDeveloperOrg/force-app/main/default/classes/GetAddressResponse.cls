/**
 * @author bruno.moreira
 */
public with sharing class GetAddressResponse {
    
    public String logradouro;
    public String complemento;
    public String unidade;
    public String cep;
    public String bairro;
    public string localidade;
    public String uf;
    public String ibge;
    public String gia;
    public String ddd;
    public string siafi;

    public GetAddressResponse() {
    }

    public static GetAddressResponse fromJson (String payload) {

        return (GetAddressResponse) JSON.deserialize(payload, GetAddressResponse.class);

    }   

    override
    public String toString() {

        return JSON.serialize(this);

    }


}