public with sharing class GetAddressResponse {
    
    String cep;
    String logradouro;
    String complemento;
    String unidade;
    String bairro;
    string localidade;
    String uf;
    String ibge;
    String gia;
    String ddd;
    string siafi;

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