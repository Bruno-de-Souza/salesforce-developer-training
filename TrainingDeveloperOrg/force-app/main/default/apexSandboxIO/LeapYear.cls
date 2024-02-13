public with sharing class LeapYear {
    public Boolean LeapYear(Integer year) {
        if (Math.mod(year, 4) == 0 && Math.mod(year, 100) != 0) {
            System.debug(' The year of ' + year + ' it is a Leap Year! ' ); 
            return true;
        } else if (Math.mod(year, 4) == 0 && Math.mod(year, 100) == 0 && Math.mod(year, 400) == 0) {
            System.debug(' The year of ' + year + ' it is a Leap Year! ' );
            return true;
        } else {
            System.debug(' The year of ' + year + ' it is not a Leap Year! ' );
            return false;
        }
    }
}