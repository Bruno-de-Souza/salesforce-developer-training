public with sharing class RockPaperScissors {
    public Integer RockPaperScissors(String player1, String player2) {
        if (player1 == 'rock' && player2 == 'paper') {
            return 2;
        } else if (player1 == 'paper' && player2 == 'rock') {
            return 1;
        } else if (player1 == 'scissors' && player2 == 'paper') {
            return 1;
        } else if (player1 == 'paper' && player2 == 'scissors') {
            return 2;
        } else if (player1 == 'rock' && player2 == 'scissors') {
            return 1;
        } else if (player1 == 'scissors' && player2 == 'rock') {
            return 2;
        } else {
            return 0;
        }
    }
}