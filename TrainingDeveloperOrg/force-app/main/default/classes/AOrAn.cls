public with sharing class AOrAn {
    public String AOrAn(String word) {
        List<String> v = new List<String>{'a', 'e', 'i', 'o', 'u'};
        return v.contains(word.substring(0, 1)) ? 'an ' + word : 'a ' + word;
    }
}