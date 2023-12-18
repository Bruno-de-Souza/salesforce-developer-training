public with sharing class OpportunityLineItemQuery {
    public static List<OpportunityLineItem> OpportunityLineItemQuery() {
        return [SELECT Id, Name, OpportunityId, Opportunity.Name, Opportunity.Account.Name, Opportunity.Account.Industry 
                FROM OpportunityLineItem ORDER BY Opportunity.Account.Name
               ];
    }
}