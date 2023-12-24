public class MapAccRatInd {
    public void MapAccRatInd() {
        Map<String, Map<String, List<Account>>> accRanInd = new Map<String, Map<String, List<Account>>>();
        List<Account> ls = [ SELECT Id, Name, Rating, Industry FROM Account ];
        for (Account acc : ls) {
            if(!accRanInd.containsKey(acc.Name)){
                accRanInd.put(acc.Name, new Map<String, List<Account>>());
            }
            if(!accRanInd.containsKey(acc.Rating)) {
                accRanInd.get(acc.Name).put(acc.Rating, new List<Account>());
            }
            accRanInd.get(acc.Name).get(acc.Rating).add(acc);
        }
        for (String acc : accRanInd.keySet()) {
            System.debug( ' ======= Account Name:  ' + acc + ' ======= ' );
            for (String ran : accRanInd.get(acc).keySet()) {
                System.debug( ' ======= Account  Rating: ' + ran + ' ======= ' );
                for (Account o : accRanInd.get(acc).get(ran)) {
                    System.debug( ' ======= Account Industry: ' + o.Industry + ' ======= ' );
                    System.debug( ' --------------------------------------------------------------------------------- ' );
                }
            }
        }
    }
}