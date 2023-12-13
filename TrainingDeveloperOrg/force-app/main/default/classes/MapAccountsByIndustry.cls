public class MapAccountsByIndustry {
    public void MapAccountsByIndustry() {
        Map<Id, List<Contact>> contactsAndAccounts = new Map<Id, List<Contact>>();
        for (Contact c : [SELECT Id, Name, Email, MobilePhone, AccountId, Account.Name, Account.Industry FROM Contact WHERE AccountId != NULL ORDER BY Account.Name]) {
            if (!contactsAndAccounts.containsKey(c.AccountId)) {
                contactsAndAccounts.put(c.AccountId, new List<Contact>());
            }
            contactsAndAccounts.get(c.AccountId).add(c);
        }
        for (Id accountId : contactsAndAccounts.keySet()) {
            Map<String, List<Contact>> contactsByIndustry = new Map<String, List<Contact>>();
            for (Contact c : contactsAndAccounts.get(accountId)) {
                if (!contactsByIndustry.containsKey(c.Account.Industry)) {
                    contactsByIndustry.put(c.Account.Industry, new List<Contact>());
                }
                contactsByIndustry.get(c.Account.Industry).add(c);
            }
            System.debug(' ======= ' + ' Account Industry: ' + contactsAndAccounts.get(accountId)[0].Account.Industry + ' ======= ');
            System.debug(' ======= ' + contactsAndAccounts.get(accountId)[0].Account.Name + ' ======= ');
            for (Contact c: contactsAndAccounts.get(accountId)) {
                System.debug(' Contacts: ');
                System.debug(' ---------------------------------- ');
                System.debug(' Name: ' + (c.Name == null ? ' Name not found! ' : ' Name: ' + c.Name));
                System.debug(' Email: ' + (c.Email == null ? ' Email not found! ' : ' EMail: ' + c.Email));
                System.debug(' MobilePhone: ' + (c.MobilePhone == null ? ' MobilePhone not found! ' : 'MobilePhone: ' + c.MobilePhone));
                System.debug(' ---------------------------------- ');
            }
        }
    }
}