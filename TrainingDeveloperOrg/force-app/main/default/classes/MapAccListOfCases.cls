public class MapAccListOfCases {
    public void MapAccListOfCases() {
        Map<Id, List<Case>> listCases = new Map<Id, List<Case>>();
        List<Case> c = [ SELECT Id, CaseNumber, AccountId, Account.Name FROM Case ORDER BY Account.Name LIMIT 100 ];
        for (Case cases : c) {
            if(!listCases.containsKey(cases.AccountId)) {
                listCases.put(cases.AccountId, new List<Case>());
            }
            listCases.get(cases.AccountId).add(cases);
        }
        for (Id accId : listCases.keySet()) {
            System.debug( ' ======= Account Name: ' + listCases.get(accId)[0].Account.Name + ' ======= ' );
            for (Case caseNumber: listCases.get(accId)) {
                System.debug( ' ======= Case Related Number: ' + caseNumber.CaseNumber + ' ======= ');        
            }
            System.debug( ' --------------------------------------------------------------------------------------- ' );
        }
        Map<Id, List<Case>> noc = new Map<Id, List<Case>>();
        List<Case> cc = [ SELECT Id FROM Case LIMIT 100 ];
        for (Case listOfCc : cc) {
            if(!noc.containsKey(listOfCc.Id)) {
                noc.put(listOfCc.Id, new List<Case>());
            }
            noc.get(listOfCc.Id).add(listOfCc);
        }
        for (Id caseId : noc.keySet()) {
            System.debug( ' ======= Number of case oppened: '  + noc.Size() + ' ======= ');
        }
    }
}