public class MapOppAcc {
    public void MapOppAcc() {
        Map<String, List<Opportunity>> MapOppByAccount = new Map<String, List<Opportunity>>();
        List<Opportunity> listOppAcc = [SELECT Id, Name, AccountId, Account.Name FROM Opportunity WHERE Account.Name != NULL];
        for (Opportunity opp : listOppAcc) {
            if(!MapOppByAccount.containsKey(opp.AccountId)){
                MapOppByAccount.put(opp.AccountId, new List<Opportunity>());
            }
            MapOppByAccount.get(opp.AccountId).add(opp);
        }
        for (String accountId : MapOppByAccount.keySet()) {
            System.debug( ' | ' + ' Account Id: ' + accountId + ' | ' + ' Account Name: ' + MapOppByAccount.get(accountId)[0].Account.Name + ' | ');
            for (Opportunity opp : MapOppByAccount.get(accountId)) {
                System.debug( ' | ' + ' OpportunityId: ' + opp.Id + ' | ' + ' Opportunity Name: ' + opp.Name + ' | ');
            }
        }
    }
}