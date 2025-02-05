/**
 * @author bruno.moreira
 */
@isTest
public class AccountManagerTest {

    @isTest
    public static Id shouldCreateAccountWithContacts () {
        
        Account account = new Account();
        account.Name = 'Test Web Service';

        insert account;
        
        Contact contact = new Contact();
        contact.FirstName = 'FirstName Web Service';
        contact.LastName = 'LastName Web Service';
        contact.AccountId = account.Id;

        insert contact;

        return account.Id;
    }

    @isTest
    public static void shouldGetAccountWithContacts () {

        Id recordId = shouldCreateAccountWithContacts();

        RestRequest request = new RestRequest();

        request.requestURI = 'https://https://bms18-dev-ed.develop.lightning.force.com//services/apexrest/Accounts/' + recordId + '/contacts';

        request.httpMethod = 'GET';
        RestContext.request = request;

        Account account = AccountManager.getAccount();

        Assert.isTrue(account != null);

        Assert.areEqual(account.Name, 'Test Web Service');
    
    }

}