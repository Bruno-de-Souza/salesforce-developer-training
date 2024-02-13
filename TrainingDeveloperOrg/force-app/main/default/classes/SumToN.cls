public with sharing class SumToN {
    public Integer SumToN(Integer n) {
        Integer sum = 0;
        for (Integer i = 0; i <= n; i++) {
            sum += i;
        }
        System.debug('Sum of the integer: ' + sum);
        return sum;
    }
}