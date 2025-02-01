/**
 * @author bruno.moreira
 */
@isTest
public class LeadProcessorTest {
    
    @isTest
    public static void shouldCreateLeads () {

        List<lead> leads = new List<lead>();

        for (Integer i = 1; i <= 10; i++) {
            
            leads.add(new Lead( LeadSource = 'Test Source', FirstName = 'Lead ', LastName = 'Test ' + i, Company = 'Test Leads' ));

        }

        insert leads;

        System.debug('Leads Before' + JSON.serialize(leads));

        Test.startTest();

        LeadProcessor leadProcessor = new leadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);

        Test.stopTest();

        Assert.areEqual(10, leads.size());

        System.debug('Leads After ' + JSON.serialize(leads));

    }

}