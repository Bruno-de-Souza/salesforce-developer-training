public class AOrAn {
    public String AOrAn(String word) {
        String w = (word.startsWith('a') || word.startsWith('e') || word.startsWith('i') || word.startsWith('o') || word.startsWith('u') ? 'an ' + word : 'a ' + word);
        return w;
    }
}