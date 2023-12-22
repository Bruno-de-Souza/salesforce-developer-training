public class MapAccountListContacts {
    public void getAccountListContacts() {
        Map<Id, List<Contact>> mapAccountContacts = new Map<Id, List<Contact>>();
        List<Contact> listContacts = [SELECT Id, Name, Account.Name FROM Contact];
        
        for (Contact con : listContacts) {
            if (!mapAccountContacts.containsKey(con.AccountId)) {
                mapAccountContacts.put(con.AccountId, new List<Contact>());
            }
            mapAccountContacts.get(con.AccountId).add(con);
        }
        
        for (Id accountId : mapAccountContacts.keySet()) {
            System.debug(
                ' Account Id: ' +
                accountId +
                ' Contacts: ' +
                mapAccountContacts.get(accountId)
            );
        }
    }
}