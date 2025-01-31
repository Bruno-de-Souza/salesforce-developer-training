/**
 * @author bruno.moreira
 */
@isTest
public class LeadProcessorTest {
    
    @isTest
    public static void shouldCreateLeads () {

        List<lead> leads = new List<lead>();

        for (Integer i = 1; i <= 200; i++) {
            
            leads.add(new Lead( LeadSource = 'Test Source', FirstName = 'Lead ', LastName = 'Test ' + i, Company = 'Test Leads' ));

        }

        insert leads;

        System.debug('Leads ' + JSON.serialize(leads));

        Test.startTest();

        LeadProcessor leadProcessor = new leadProcessor();
        Id batchId = Database.executeBatch(leadProcessor);

        Test.stopTest();

        Assert.areEqual(200, leads.size());

    }

}