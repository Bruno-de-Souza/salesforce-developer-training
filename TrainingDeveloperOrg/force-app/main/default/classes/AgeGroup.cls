public with sharing class AgeGroup {
  public String AgeGroup(Integer n) {
    if (n >= 0 && n <= 1) {
      return 'Infant';
    } else if (n >= 2 && n <= 14) {
      return 'Child';
    } else if (n >= 15 && n <= 21) {
      return 'Youth';
    } else {
      return 'Adult';
    }
  }
}
