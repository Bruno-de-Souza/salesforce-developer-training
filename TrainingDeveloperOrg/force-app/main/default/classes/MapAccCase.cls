public class MapAccCase {
    public void MapAccCase() {
        Map<Id, List<Case>> listAccCase = new Map<Id, List<Case>>();
        List<Case> listCase = [SELECT Id, AccountId, Account.Name FROM Case LIMIT 10];
        for (Case c : listCase) {
            if(!listAccCase.containsKey(c.AccountId)) {
                listAccCase.put(c.AccountId, new List<Case>());
            }
            listAccCase.get(c.AccountId).add(c);
        }
        for (Id accName : listAccCase.keySet()) {
            System.debug(' ======== Account Name: ' + listAccCase.get(accName)[0].Account.Name + ' ======= ' + ' Account Id: ' + listAccCase.get(accName)[0].AccountId);
            for (Case caseId : listAccCase.get(accName)) {
                System.debug(caseId.Id == null ? ' No case found! ' : ' ======= Case Id: ' + caseId.Id + ' ======= ');
            }
        }
    }
}