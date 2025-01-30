@IsTest
public class AccountProcessorTest {

    @IsTest
    public static void countContactsByAccount() {

        Account account = new Account();
        account.Name = 'Test 01';
        
        insert account;

        Contact contact = new Contact();
        contact.FirstName = 'Test';
        contact.LastName = 'Contact 01';
        contact.AccountId = account.Id;

        insert contact;

        Set<Id> Ids = new Set<Id>();
        Ids.add(account.Id);

        Test.startTest();

        AccountProcessor.countContacts(Ids);

        Test.stopTest();

        List<Account> accounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE ID =: account.Id LIMIT 1];

        Assert.areEqual(1, accounts.size());

    }

}
