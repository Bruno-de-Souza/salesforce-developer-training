public class ListAccountListContacts {
    public void getAccountListContacts(){
        List<Contact> listContacts = [SELECT Id, Name, Account.Name, AccountId FROM Contact WHERE AccountId != Null];
        for (Contact con : listContacts) {
            System.debug(' Account Id: ' + con.AccountId + ' Account Name: ' + con.Account.Name + ' Contact Name: ' + con.Name);
        }
    }
}