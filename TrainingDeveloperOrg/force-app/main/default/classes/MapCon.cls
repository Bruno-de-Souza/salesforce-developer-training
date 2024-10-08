/**
 * @author bruno.moreira
 */
public class MapCon {
    public void MapCon() {
        Map<Id, Contact> listCon = new Map<Id, Contact>([SELECT Id, Name FROM Contact Order By Name LIMIT 50]);
        Integer conSum = listCon.size();
        for (Id con: listCon.keySet()) {
            System.debug(' The Contact Name Is: ' + listCon.get(con).Name + ' | ' + ' The Contact Id Is: ' + listCon.get(con).Id);
        }
        System.debug(' The total of contacts is: ' + conSum);
    }
}