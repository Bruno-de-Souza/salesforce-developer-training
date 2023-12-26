public class MapIndAccEmpCon {
    public void MapIndAccEmpCon() {
        Map<String, Map<String, Map<Integer, List<Contact>>>> listCon = new Map<String, Map<String, Map<Integer, List<Contact>>>>();
        List<Contact> Con = [ SELECT Account.Industry, Account.Name, Account.NumberOfEmployees, Name FROM Contact LIMIT 100];
        for (Contact c : Con) {
            if (!listCon.containsKey(c.Account.Industry)) {
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
        for (String accIndustry : listCon.keySet()) {
            System.debug( accIndustry == NULL ? ' ======= Industry Not Found! ======= ' : ' ======= Account Industry: ' + accIndustry + ' ======= ' );
            for (String accName : listCon.get(accIndustry).keySet()) {
                System.debug( ' ======= Account Name:  '  +  accName + ' ======= ' );
                for ( Integer accNumberOfEmployees : listCon.get(accIndustry).get(accName).keySet()) {
                    System.debug( accNumberOfEmployees == NULl ? ' ======= Number Of Employees Not Found! ' : ' ======= Number Of Employees: '  + accNumberOfEmployees + ' ======= ' );
                    for (Contact conName : listCon.get(accIndustry).get(accName).get(accNumberOfEmployees)) {
                        System.debug( ' ======= Contact Related Name: '  + conName.Name + ' ======= ' );
                    }
                }
            }
            System.debug( ' ---------------------------------------------------------------------------- ' );
        }
    }
}