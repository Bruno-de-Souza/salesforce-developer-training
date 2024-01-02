public class MapAccAndCases {
    public void MapAccAndCases() {
        Map<String, Map<String, List<Case>>> listOfAccAndCases = new Map<String, Map<String, List<Case>>>();
        List<Case> c = [ SELECT Account.Name, CaseNumber FROM Case Order By CaseNumber asc LIMIT 100 ];
        for (Case cases : c) {
            if(!listOfAccAndCases.containsKey(cases.Account.Name)) {
                listOfAccAndCases.put(cases.Account.Name, new Map<String, List<Case>>());
            }
            if(!listOfAccAndCases.get(cases.Account.Name).containsKey(cases.CaseNumber)) {
                listOfAccAndCases.get(cases.Account.Name).put(cases.CaseNumber, new List<Case>());
            }
            listOfAccAndCases.get(cases.Account.Name).get(cases.CaseNumber).add(cases);
        }
        for (String accName : listOfAccAndCases.keySet()) {
            System.debug(' ======= Account Name: ' + accName + ' ======= ');
            Integer totalNumberOfCases = 0;
            for (String caseNumber : listOfAccAndCases.get(accName).keySet()) {
                System.debug(caseNumber == NULL ? ' ======= Case Number Not Found! ' + ' ======= ' : ' ======= Case Number: ' + caseNumber + ' ======= ');
                totalNumberOfCases += listOfAccAndCases.get(accName).get(caseNumber).size();
            }
            System.debug(' ======= Total Of Cases: ' + totalNumberOfCases + ' ======= ');
            System.debug(' -------------------------------------------------------------------------------------------- ');
        }
    }
}