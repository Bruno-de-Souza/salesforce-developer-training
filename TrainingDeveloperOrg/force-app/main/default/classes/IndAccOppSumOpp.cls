public class IndAccOppSumOpp {
    public void IndAccOppSumOpp() {
        Map<String, Map<String, Map<Id, List<Opportunity>>>> mapIndAccOppSumOpp = new Map<String, Map<String, Map<Id, List<Opportunity>>>>();
        List<Opportunity> cons = [ SELECT Id, Name, Account.Industry, Account.Name FROM Opportunity ORDER BY Account.Industry LIMIT 100 ];
        for (Opportunity c : cons) {
            if (!mapIndAccOppSumOpp.containsKey(c.Account.Industry)) {
                mapIndAccOppSumOpp.put(c.Account.Industry, new Map<String, Map<Id, List<Opportunity>>>());
            }
            if (!mapIndAccOppSumOpp.get(c.Account.Industry).containsKey(c.Account.Name)) {
                mapIndAccOppSumOpp.get(c.Account.Name).put(c.Account.Name, new Map<Id, List<Opportunity>>());
            }
            if (!mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).containsKey(c.Id)) {
                mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).put(c.Id, new List<Opportunity>());
            }
            mapIndAccOppSumOpp.get(c.Account.Industry).get(c.Account.Name).get(c.Id).add(c);
        }
    }
}