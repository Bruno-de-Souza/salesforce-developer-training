public class MapCollection {
    //A map is a collection of 'Key' - 'Value' pairs
    //Keys are always unique haveing a value associetad
    //Values can be duplicate
    public void myMethod() {
        Map<Integer, String> intToStrMap = new Map<Integer, String>();
        intToStrMap.put(1, 'A');
        intToStrMap.put(2, 'B');
        intToStrMap.put(3, 'A');
        System.debug('My map collection: ' + intToStrMap);
    }
}