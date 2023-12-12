public with sharing class WhileLoopsInApex {
    public WhileLoopsInApex() {
        Integer i = 1;
        while (i <= 7) {
            System.debug('The number is: ' + i);
            i++;
        }
    }
}