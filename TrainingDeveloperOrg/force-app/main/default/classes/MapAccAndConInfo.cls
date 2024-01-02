public class MapAccAndConInfo {
    public void MapAccAndConInfo() {
        Map<String, Map<String, Map<String, List<Contact>>>> listOfConsAndAccs = new Map<String, Map<String, Map<String, List<Contact>>>>();
        List<Contact> con = [ SELECT Account.Name, Name, Title, Email FROM Contact ORDER BY Account.Name LIMIT 100 ];
        
        for (Contact c : con) {
            if (!listOfConsAndAccs.containsKey(c.Account.Name)) {
                listOfConsAndAccs.put(c.Account.Name, new Map<String, Map<String, List<Contact>>>());
            }
            if (!listOfConsAndAccs.get(c.Account.Name).containskey(c.Name)) {
                listOfConsAndAccs.get(c.Account.Name).put(c.Name, new Map<String, List<Contact>>());
            }
            if (!listOfConsAndAccs.get(c.Account.Name).get(c.Name).containsKey(c.Title)) {
                listOfConsAndAccs.get(c.Account.Name).get(c.Name).put(c.Title, new List<Contact>());
            }
            listOfConsAndAccs.get(c.Account.Name).get(c.Name).get(c.Title).add(c);
        }
        
        for (String accName : listOfConsAndAccs.keySet()) {
            System.debug(' ======= Account Name: ' + accName + ' ======= ');
            Integer totalOfCons = 0;
            for (String conName : listOfConsAndAccs.get(accName).keySet()) {
                System.debug(' ======= Contact Name: ' + conName + ' ======= ');
                for (String conTitle : listOfConsAndAccs.get(accName).get(conName).keySet()) {
                    System.debug(conTitle == NULL ? ' ======= No Contact Title Found! ' + ' ======= ' : ' ======= Contact Title: ' + conTitle + ' ======= ');
                    for (Contact conEmail : listOfConsAndAccs.get(accName).get(conName).get(conTitle)) {
                        System.debug(conEmail.Email == NULL ? ' ======= No Contact Email Found! ' + ' ======= ' : ' ======= Contact Email: ' + conEmail.Email + ' ======= ');
                        totalOfCons = totalOfCons + listOfConsAndAccs.get(accName).get(conName).get(conTitle).size();
                    }
                }
            }
            System.debug(' ======= Total Of Contacts Per Account: ' + totalOfCons + ' ======= ');
            System.debug(' ---------------------------------------------------------------------------------------------- ');
        }
    }
}