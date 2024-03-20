public class MapConAccount {
    public void MapConAccount() {
        Map<String, Map<String, List<Contact>>> listOfConAcc = new Map<String, Map<String, List<Contact>>>();
        List<Contact> listCon = [SELECT Id, Name, Account.Name 
                                 FROM Contact 
                                 ORDER BY NAME DESC LIMIT 100];
        //Integer totalCon = listOfConAcc.size();
        
        for (Contact cc : listCon) {
            if (!listOfConAcc.containsKey(cc.Name)) {
                listOfConAcc.put(cc.Name, new Map<String, List<Contact>>());
            }
            if (!listOfConAcc.get(cc.Name).containsKey(cc.Account.Name)) {
                listOfConAcc.get(cc.Name).put(cc.Account.Name, new List<Contact>());
            }
            listOfConAcc.get(cc.Name).get(cc.Account.Name).add(cc);
        }
        for (String conName : listOfConAcc.keySet()) {
            System.debug( ' Contact Name: ' + conName);
            for (String accName : listOfConAcc.get(conName).keySet()) {
                System.debug( ' Account Name: ' + accName);
            }
            System.debug(' ***************************************************** ');
        } 
    }
}