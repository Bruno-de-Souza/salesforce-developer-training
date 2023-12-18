public class MapContactsByAccount {
    public void MapContactsByAccount() {
        Map<Id, List<Contact>> contactsAndAccounts = new Map<Id, List<Contact>>();
        for (Contact c : [SELECT Id, Name, Email, MobilePhone, AccountId, Account.Name FROM Contact WHERE AccountId != NULL ORDER BY Account.Name]) {
            if (!contactsAndAccounts.containsKey(c.AccountId)) {
                contactsAndAccounts.put(c.AccountId, new List<Contact>());
            }
            contactsAndAccounts.get(c.AccountId).add(c);
        }       
        for (Id accountId : contactsAndAccounts.keySet()) {
            System.debug( ' ======= ' + contactsAndAccounts.get(accountId)[0].Account.Name + ' ======= ');
            System.debug(' Contacts: ');
            for (Contact c: contactsAndAccounts.get(accountId)) {
                System.debug(' Name: ' + (c.Name == null ? ' Name not found! ' : ' Name: ' + c.Name));
                System.debug(' Email: ' + (c.Email == null ? ' Email not found! ' : ' EMail: ' + c.Email));
                System.debug(' MobilePhone: ' + (c.MobilePhone == null ? ' MobilePhone not found! ' : 'MobilePhone: ' + c.MobilePhone));
                System.debug(' ---------------------------------- ');
            }
        }
    }
}