public class IndAccOppSumOpp {
    public void IndAccOppSumOpp() {
        Map<String, Map<String, Map<Id, List<Opportunity>>>> mapIndAccOppSumOpp = new Map<String, Map<String, Map<Id, List<Opportunity>>>>();
        List<Opportunity> cons = [ SELECT Id, Name, Account.Industry, Account.Name, Account.Id FROM Opportunity ORDER BY Account.Industry LIMIT 100 ];
        for (Opportunity c : cons) {
            if (!mapIndAccOppSumOpp.containsKey(c.Account.Industry)) {
                mapIndAccOppSumOpp.put(c.Account.Industry, new Map<String, Map<Id, List<Opportunity>>>());
            }
            if (!mapIndAccOppSumOpp.get(c.Account.Industry).containsKey(c.Account.Name)) {
                mapIndAccOppSumOpp.get(c.Account.Industry).put(c.Account.Name, new Map<Id, List<Opportunity>>());
            }
            if (!mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).containsKey(c.Id)) {
                mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).put(c.Id, new List<Opportunity>());
            }
            mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).get(c.Id).add(c);
        }
        for (String ind : mapIndAccOppSumOpp.keySet()) {
            System.debug(' ======= Account Industry: ' + ind + ' ======= ');
            Integer sumAcc = 0;
            sumAcc = sumAcc + mapIndAccOppSumOpp.get(ind).size();
            Integer sumOpp = 0;
            for (String acc : mapIndAccOppSumOpp.get(ind).keySet()) {
                System.debug(' ======= Account Name: ' + acc + ' ======= ');
                for (Id opp : mapIndAccOppSumOpp.get(ind).get(acc).keySet()) {
                    System.debug(' ======= Opportunity Name: ' + mapIndAccOppSumOpp.get(ind).get(acc).get(opp)[0].Name + ' ======= ');
                    sumOpp = sumOpp + mapIndAccOppSumOpp.get(ind).get(acc).get(opp).size();
                }
            }
            System.debug(' ======= Total Of Opportunities Per Account: ' + sumOpp + ' ======= ');
            System.debug(' ======= Total Of Accounts Per Industry: ' + sumAcc + ' ======= ');
            System.debug(' ------------------------------------------------------------------------------------------------------------- ');
        }
    }
}