/**
 * @author bruno.moreira
 */
@isTest
public class DailyLeadProcessorSchedulableTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    @isTest
    static void shouldCreateLeadsToUpdate () {

        List<Lead> leads = new List<Lead>();

        for (Integer i = 1; i <= 200; i++) {

            leads.add( new Lead ( FirstName = 'Test ' + i, LastName = 'LastName ' + i, Company = 'Bruno ' + i) );

        }

        insert leads;

        Map<Id, Lead> groupLeadsByIds = new Map<Id, Lead>(leads);
        
        List<Id> iDs = new List<Id>(groupLeadsByIds.keySet());

        Test.startTest();

        String jobId = System.schedule('DailyLeadProcessorTest', CRON_EXP, new DailyLeadProcessor());

        List<Task> tasks = [ SELECT Id, WhatId FROM Task WHERE WhatId =: iDs ];

        Assert.areEqual(0, tasks.size());

        Test.stopTest();

        tasks = [ SELECT Id, WhatId FROM Task WHERE WhatId =: iDs ];

        System.assertEquals(0, tasks.size(), 'Nothing is Here!');

    }

}