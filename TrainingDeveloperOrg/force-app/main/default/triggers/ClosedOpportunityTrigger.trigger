trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Opportunity> toProcess = null;
    switch on Trigger.operationType {
        when AFTER_INSERT {
            toProcess = Trigger.New;
        }
        when AFTER_UPDATE {
            toProcess = [ SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' ];
        }
    }
}