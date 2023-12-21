public class MapLeadUser {
    public void MapLeadUser() {
        Map<Id, List<Lead>> listLeadUsers = new Map<Id, List<Lead>>();
        List<Lead> leads = [SELECT Id, Name, Owner.Name, Company FROM Lead ORDER BY Name LIMIT 10];
        for (Lead l : leads) {
            if(!listLeadUsers.containsKey(l.Id)) {
                listLeadUsers.put(l.Id, new List<Lead>());
            }
            listLeadUsers.get(l.Id).add(l);
        }
        for (Id ls : listLeadUsers.keySet()) {
            System.debug( ' ======= Lead Name: ' + listLeadUsers.get(ls)[0].Name + ' ======= ');
            for (Lead lsList : listLeadUsers.get(ls)) {
                System.debug( ' ======= Lead Owner: ' + lsList.Owner.Name + ' ======= Company Name: ' + lsList.Company);
            }
        }
    }
}