public class mapOfAccounts {
    public void mapOfAccounts() {
        Map<Id, Account> acc = new Map<Id, Account>([SELECT Id, Name, Ownership FROM Account LIMIT 100]);
        for (Id c : acc.keySet()) {
            System.debug(' List Of Accounts: ' + acc.get(c).Name);
            System.debug(' List Of Accounts IDs: ' + acc.get(c).Id);
            System.debug(' ----------------------------------------------------------------- ');
        }
    }
}