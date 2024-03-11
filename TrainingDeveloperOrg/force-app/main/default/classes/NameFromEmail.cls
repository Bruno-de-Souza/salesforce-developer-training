public with sharing class NameFromEmail {
    public String NameFromEmail(String email) {
        String firstName = email.substringBefore('.');
        String lastName = email.substringBetween('.', '@');

        return firstName.toLowerCase().capitalize() + ' ' + lastName.toLowerCase().capitalize(); 
    }
}