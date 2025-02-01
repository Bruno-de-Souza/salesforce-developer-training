/**
 * @author bruno.moreira
 */
@isTest
public class AddPrimaryContactTest {
    
    @isTest
    public static void shouldAddPrimaryContact() {

        List<Account> accounts = new List<Account>();
    
        for (Integer i = 1; i <= 50; i++) {

            accounts.add( new Account (Name = 'Test ' + i, BillingState = 'NY') );  

        }

        for (Integer j = 1; j <= 50; j++) {

            accounts.add( new Account (Name = 'Test ' + j, BillingState = 'CA') );

        }

        insert accounts;

        System.debug(JSON.serialize(accounts));

        Contact contact = new Contact (LastName = 'Test Contact');

        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact, 'CA');

        Test.startTest();

        System.enqueueJob(addPrimaryContact);

        Test.stopTest();

        system.assertEquals(50, [SELECT count() FROM Contact]);

        System.debug(JSON.serialize(accounts));

    }

}