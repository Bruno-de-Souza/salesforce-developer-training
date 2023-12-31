public class MapAccListOfCases {
    public void MapAccListOfCases() {
        Map<String, Map<String, List<Case>>> listCases = new Map<String, Map<String, List<Case>>>();  
        List<Case> c = [ SELECT Id, CaseNumber, Account.Name FROM Case ORDER BY Account.Name LIMIT 100 ];
        for (Case cases : c) {
            if(!listCases.containsKey(cases.Account.Name)) {
                listCases.put(cases.Account.Name, new Map<String, List<Case>>());
            }
            if(!listCases.get(cases.Account.Name).containsKey(cases.CaseNumber)) {
                listCases.get(cases.Account.Name).put(cases.CaseNumber, new List<Case>());
            }
            listCases.get(cases.Account.Name).get(cases.CaseNumber).add(cases);
        }
        for (String accName : listCases.keySet()) {
            System.debug( ' ======= Acc Name: ' + accName + ' ======= ');
            for (String caseNumber : listCases.get(accName).keySet()) {
                System.debug( caseNumber == NULL ? ' ======== Case Number Not Found! ' + ' ======== ' : ' ======= Case Number: ' + caseNumber + ' ======= ');
                for (Case totalOfCasesOpened : listCases.get(accName).get(caseNumber)) {
                    System.debug(' ======= Total Of Cases Opened: ' + listCases.get(accName).get(caseNumber)[0].Id + ' ======= ');
                }
            }
            System.debug( ' ------------------------------------------------------------------------------------ ' );
        }
    }
}