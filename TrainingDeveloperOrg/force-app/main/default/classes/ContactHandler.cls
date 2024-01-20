public class ContactHandler {
    public void conList() {
        Map<Id, Contact> con = new Map<Id, Contact>([SELECT Id, Name, LastName FROM Contact LIMIT 100]);
        for (Id  c : con.keySet()) {
            Contact cons = con.get(c);
            System.debug(' Contact Name: ' + cons.Name);
            System.debug(' Contact ID: ' + cons.Id);
            System.debug(' --------------------------------- ');
        }
    }
}