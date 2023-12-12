public with sharing class ForLoopsWithList {
    public ForLoopsWithList() {
        List<String> cars = new List<String>{'Gol', 'Toyota', 'Peugeot', 'Fiat', 'Jeep'};
        for (String c : cars) {
            System.debug('Cars: ' + c);
        } 
    }
}