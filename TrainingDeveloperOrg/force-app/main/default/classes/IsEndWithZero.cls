public with sharing class IsEndWithZero {
    public Boolean IsEndWithZero(Integer num) {
        // If a number ends with zero return true, otherwise return false
        return (Math.mod(num, 10) == 10);
    }
}