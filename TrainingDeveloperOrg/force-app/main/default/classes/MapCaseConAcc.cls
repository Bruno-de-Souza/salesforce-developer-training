public class MapCaseConAcc {
    public void MapCaseConAcc() {
        //Map<String, Map<String, Map<String, List<Case>>>> listCaseConAcc = new Map<String, Map<String, Map<String, List<Case>>>>();
        Map<String, Map<String, List<Case>>> listCaseConAcc = new Map<String, Map<String, List<Case>>>();
        List<Case> listCase = [ SELECT CaseNumber, Contact.Name, Account.Name FROM Case ORDER BY CaseNumber LIMIT 100 ];
        for (Case c : listCase) {
            if(!listCaseConAcc.containsKey(c.CaseNumber)) {
                listCaseConAcc.put(c.CaseNumber, new Map<String, List<Case>>());
            }
            if(!listCaseConAcc.get(c.CaseNumber).containsKey(c.Contact.Name)) {
                listCaseConAcc.get(c.CaseNumber).put(c.Contact.Name, new List<Case>());
            }
            listCaseConAcc.get(c.CaseNumber).get(c.Contact.Name).add(c);
        }
        for (String cNumber : listCaseConAcc.keySet()) {
            System.debug(' ======= Case Number:  ' + cNumber + ' ======= ');
            for (String conName : listCaseConAcc.get(cNumber).keySet()) {
                System.debug(' ======= Contact name: ' + conName + ' ======= ');
                for (Case accName: listCaseConAcc.get(cNumber).get(conName)) {
                    System.debug(' ======= Account Name: ' + accName.Account.Name + ' ======= ');
                }
            }
            System.debug( ' ---------------------------------------------------------------------------- ' );
        }
    }
}