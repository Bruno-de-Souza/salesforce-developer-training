/**
 * @author bruno.moreira
 */

 //URI Default /services/apexrest/yourObject/

@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    
    @HttpGet
    global static Account getAccount() {

        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substringBetween('/Accounts/','/contacts');

        Account accounts = [

            SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Id =: accountId

        ];

        System.debug('Accounts: ' + accounts);

        return accounts;

    }

}