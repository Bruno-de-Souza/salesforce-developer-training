trigger AddRelatedRecord on Account (after insert, after update) {   
    List<Opportunity> oppList = new List<Opportunity>();
    List<Account> toProcess = null;
    switch on Trigger.operationType {
        when AFTER_INSERT {
            toProcess = Trigger.New;
        }
        when AFTER_UPDATE {
            toProcess = [ SELECT Id, Name FROM Account
                         WHERE Id IN :Trigger.New AND
                         Id Not IN (SELECT AccountId FROM Opportunity WHERE AccountId IN :Trigger.New)];
        }
    }
    for (Account a : toProcess) {
        oppList.add(new Opportunity(Name = a.Name + ' Opportunity ',
                                    StageName =' Prospecting ',
                                    CloseDate=System.today().addMonths(1),
                                    AccountId=a.Id));
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}