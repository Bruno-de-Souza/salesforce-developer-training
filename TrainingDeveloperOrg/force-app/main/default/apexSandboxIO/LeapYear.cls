public with sharing class LeapYear {
    public Boolean isLeapYear(Integer year) {
        if(Math.mod(year, 4) == 0 && Math.mod(year, 100) == 0 && Math.mod(year, 400) == 0) {
            System.debug( ' ======= ' +  Year + ' is a Leap Year! ' + ' ======= ');
            return true;
        } else if (Math.mod(year, 4) == 0 && Math.mod(year, 100) != 0 && Math.mod(year, 400) != 0) {
            System.debug( ' ======= ' +  Year + ' is a Leap Year! ' + ' ======= ');
            return true;
        } else {
            System.debug( ' ======= ' +  Year + ' is not a Leap Year! ' + ' ======= ');
            return false;
        }
    }
}