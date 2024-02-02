/*
Given a person's age, return true if the person is a teenager (age 13 - 19).
*/
public with sharing class IsTeenager {
    public Boolean IsTeenager(Integer age) {
        return age >= 13 && age <= 19;
    }
}