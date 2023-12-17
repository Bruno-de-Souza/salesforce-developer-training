public class MapAccountsByIndustry {
    public void MapAccountsByIndustry() {
        Map<String, Map<Id, Map<Id, List<OpportunityLineItem>>>> mapAccountsByIndustryAndOpportunities = new Map<String, Map<Id, Map<Id, List<OpportunityLineItem>>>>();
        for (OpportunityLineItem opp : [SELECT Id, Name, Opportunity.AccountId, Opportunity.Account.Name, Opportunity.Account.Industry, Opportunity.Name, OpportunityId FROM OpportunityLineItem]){
            if(!mapAccountsByIndustryAndOpportunities.containsKey(opp.Opportunity.AccountId)) {
                mapAccountsByIndustryAndOpportunities.put(opp.Opportunity.AccountId,  new Map<Id, Map<Id, List<OpportunityLineItem>>>());
            }
            mapAccountsByIndustryAndOpportunities.get(opp.Opportunity.AccountId).get(opp.Opportunity.Account.Industry).get(opp.OpportunityId).add(opp);
        }
        for (String accountIndustry : mapAccountsByIndustryAndOpportunities.keySet()) {
            mapAccountsByIndustryAndOpportunities.get(accountIndustry);
            System.debug(' ======= ' + accountIndustry + ' ======= ');
        }
    }
}