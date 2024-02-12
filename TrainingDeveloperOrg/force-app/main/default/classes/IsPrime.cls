public with sharing class IsPrime {
    public Boolean IsPrime(Integer num) {
        for (Integer i = 2; i < num; i++) {
            if (Math.mod(num, i) == 0) return false;
        }
        return true;
    }
}