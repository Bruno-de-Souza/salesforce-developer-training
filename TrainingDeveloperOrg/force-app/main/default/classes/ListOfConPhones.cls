public class ListOfConPhones {
    public void ListOfConPhones() {
        Map<Id, Contact> listCon = new Map<Id, Contact>([SELECT Id, Name, Phone FROM Contact ORDER BY Name]);
        for (Id c: listCon.keySet()) {
            System.debug(' ======= Contact Name: ' + listCon.get(c).Name + ' - ' + 'Phone Number: ' + listCon.get(c).Phone + ' ======= ');
        }
    }
}