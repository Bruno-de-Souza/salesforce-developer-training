public class ListCollection {
    //An ordered colletcion of elements
    //It does contain duplicate elements
    public void myMethod() {
        List<String> strList = new List<String>();
        strList.add('Bruno');
        strList.add('Bruno');
        strList.add('Moreira');
        strList.add('Moreira');
        System.debug('My list collection: ' + strList);
    }
}