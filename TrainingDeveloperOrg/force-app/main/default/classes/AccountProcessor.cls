/**
 * @author bruno.moreira
 */
public class AccountProcessor {

    @future
    public static void countContacts (Set<Id> Ids) {

        List<Account> accounts = [ SELECT Id, Number_Of_Contacts__c, ( SELECT Id FROM Contacts ) FROM Account WHERE ID IN: Ids ];

        for ( Account account: accounts ) {

            List<Contact> contacts = account.Contacts;

            account.Number_Of_Contacts__c = contacts.size();

        }

        update accounts;

        System.debug('Accounts Updated: ' + accounts);

    }

}