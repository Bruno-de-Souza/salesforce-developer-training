public with sharing class EvenOrOdd {
    public String EvenOrOdd(Integer num) {
        if (Math.mod(num, 2) == 0) {
            return 'even';
        } else {
            return 'odd';
        }
    }
}