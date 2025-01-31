/**
 * @author bruno.moreira
 */
public class LeadProcessor implements Database.Batchable<SObject> {

    public Database.QueryLocator start (Database.BatchableContext bc) {

        return Database.getQueryLocator(
            
            'SELECT Id, LeadSource FROM Lead' 

        );

    }

    public void execute (Database.BatchableContext bc, List<Lead> scope) {

        for (Lead leads: scope) {

            leads.LeadSource = 'Dreamforce';

        }

        System.debug('Leads: ' + scope);

        update scope;

    }

    public void finish (Database.BatchableContext bc) {

        AsyncApexJob job = [ SELECT Id, Status, JobItemsProcessed
                            , TotalJobItems, NumberOfErrors 
                            FROM AsyncApexJob 
                            WHERE ID = :bc.getJobId() ];

        System.debug('Finish: ' + bc);                            


    }

}