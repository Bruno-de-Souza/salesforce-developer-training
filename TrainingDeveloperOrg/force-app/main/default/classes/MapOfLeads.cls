public class MapOfLeads {
    public void leads() {
        Map<Id, Lead> listOfLeads = new Map<Id, Lead>([SELECT Id, Name FROM Lead ORDER BY Name]);
        for (Id l : listOfLeads.keySet()) {
            System.debug(' The Lead Id is: ' + listOfLeads.get(l).Id + ' | ' + 'The Lead Name is: ' + listOfLeads.get(l).Name);
        }
    }
}