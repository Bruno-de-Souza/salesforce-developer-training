public with sharing class FullName {
    public String formatName(String firstName, String lastName) {
        System.debug('The name is: ' + firstName + ' ' + lastName);
        return (firstName + ' ' + lastName);
    }
}