/* 
    Given two strings firstName and lastName, return the name in the format LastName, FirstName. In case one of the names is null or empty, return only the non-empty part of the name. If both are null or empty, return an empty string.
*/
public with sharing class FormatName {
    public String FormatName(String firstName, String lastName) {
        if (String.isBlank(firstName) && String.isBlank(lastName)) {
            return '';
        } else if (String.isBlank(firstName)) {
            return lastName;
        } else if (String.isBlank(lastName)) {
            return firstName;
        } else {
            return lastName + ', ' + firstName;
        }
    }
}