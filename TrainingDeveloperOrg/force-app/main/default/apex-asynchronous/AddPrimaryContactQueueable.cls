/**
 * @author bruno.moreira
 */
public class AddPrimaryContact implements Queueable {

    public Contact contact;

    public String state;

    public AddPrimaryContact(Contact contact, String state) {

        this.contact = contact;
        this.state = state;

    }

    public void execute (QueueableContext Context) {

        List<Account> accounts = [SELECT Id, BillingState FROM Account WHERE BillingState =: state LIMIT 200];

        List<Contact> contacts = new List<Contact>();

        for (Account account: accounts) {

            Contact contactCloned = contact.clone(false, false, false, false);

            contactCloned.AccountId = account.Id;

            contacts.add(contactCloned);

        }

        insert contacts;
 
    }

}