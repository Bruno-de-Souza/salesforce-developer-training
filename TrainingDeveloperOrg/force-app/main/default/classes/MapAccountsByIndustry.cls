public class MapAccountsByIndustry {
    public void MapAccountsByIndustry() {
        Map<String, Map<Id, Map<Id, List<OpportunityLineItem>>>> mapAccountsByIndustryOpps = new Map<String, Map<Id, Map<Id, List<OpportunityLineItem>>>>();
        for(OpportunityLineItem oppLineItem : OpportunityLineItemQuery.OpportunityLineItemQuery()) {
            if(!mapAccountsByIndustryOpps.containsKey(oppLineItem.Opportunity.Account.Industry)) {
                mapAccountsByIndustryOpps.put(oppLineItem.Opportunity.Account.Industry, new Map<Id, Map<Id, List<OpportunityLineItem>>>());
            }
            if(!mapAccountsByIndustryOpps.get(oppLineItem.Opportunity.Account.Industry).containsKey(oppLineItem.Opportunity.AccountId)) {
                mapAccountsByIndustryOpps.get(oppLineItem.Opportunity.Account.Industry).put(oppLineItem.Opportunity.AccountId, new Map<Id, List<OpportunityLineItem>>());
            }
            if(!mapAccountsByIndustryOpps.get(oppLineItem.Opportunity.Account.Industry).get(oppLineItem.Opportunity.AccountId).containsKey(oppLineItem.OpportunityId)) {
                mapAccountsByIndustryOpps.get(oppLineItem.Opportunity.Account.Industry).get(oppLineItem.Opportunity.AccountId).put(oppLineItem.OpportunityId, new List<OpportunityLineItem>());
            }
            mapAccountsByIndustryOpps.get(oppLineItem.Opportunity.Account.Industry).get(oppLineItem.Opportunity.AccountId).get(oppLineItem.OpportunityId).add(oppLineItem);
        }
        for (String industry : mapAccountsByIndustryOpps.keySet()) {
            System.debug(industry == null ? ' ======= Account Industry Not Found! ' + ' ======= ': + ' ======= Account Industry: ' + industry + ' ======= ');
            for (Id accountId : mapAccountsByIndustryOpps.get(industry).keySet()) {
                System.debug(accountId == null ? ' ======= Account Name Not Found! ' + ' ======= ' : + ' ======= Account Name: ' +  mapAccountsByIndustryOpps.get(industry).get(accountId).values()[0][0].Opportunity.Account.Name + ' ======= ');
                for (Id opportunityId : mapAccountsByIndustryOpps.get(industry).get(accountId).keySet()) {
                    System.debug(opportunityId == null ? ' ======= Opportunity Not Found! ' + ' ======= ' : + ' ======= Opportunity Name: ' + mapAccountsByIndustryOpps.get(industry).get(accountId).get(opportunityId)[0].Opportunity.Name + ' ======= ');
                    for (OpportunityLineItem oppLineItem : mapAccountsByIndustryOpps.get(industry).get(accountId).get(opportunityId)) {
                        System.debug(oppLineItem == null ? ' ======= Opportunity Line Item Not Found! ' + ' ======= ' : + ' ======= Opportunity Line Item Name: ' + oppLineItem.Name + ' ======= ');
                    }
                }
            }
        }
    }
}