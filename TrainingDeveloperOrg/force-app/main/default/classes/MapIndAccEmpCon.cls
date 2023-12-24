public class MapIndAccEmpCon {
    public void MapIndAccEmpCon() {
        Map<String, Map<String, Map<Integer, List<Contact>>>> listCon = new Map<String, Map<String, Map<Integer, List<Contact>>>>();
        List<Contact> Con = [ SELECT Id, Name, Account.Name, Account.Industry, Account.NumberOfEmployees FROM Contact LIMIT 100];
        for (Contact c : Con) {
            if (!listCon.ContainsKey(c.Account.Industry)) {
                listCon.put(c.Account.Industry, new Map<String, Map<Integer, List<Contact>>>());
            }
            if (!listCon.get(c.Account.Industry).containsKey(c.Account.Name)) {
                listCon.get(c.Account.Industry).put(c.Account.Name, new Map<Integer, List<Contact>>());
            }
            if (!listCon.get(c.Account.Industry).get(c.Account.Name).containsKey(c.Account.NumberOfEmployees)) {
                listCon.get(c.Account.Industry).get(c.Account.Name).put(c.Account.NumberOfEmployees, new List<Contact>());
            }
            listCon.get(c.Account.Industry).get(c.Account.Name).get(c.Account.NumberOfEmployees).add(c);
        }
        for (String accInd : listCon.keySet()) {
            
        }
    }
}