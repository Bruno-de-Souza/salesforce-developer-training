/*
Given Integers a, b, and c, determine if any two of them add up to the third and return 'a', 'b', 'c' depending on which the sum is. If no two numbers add up to a third number, return an empty string. Assume that multiple solutions do not exist.
*/
public with sharing class WhichTwo {
  public String WhichTwo(Integer a, Integer b, Integer c) {
    if (a + c == b) {
      return 'b';
    } else if (b + c == a) {
      return 'a';
    } else if (c + a == b) {
      return 'b';
    } else if (a + b == c) {
      return 'c';
    } else if (c + b == a) {
      return 'a';
    } else if (b + a == c) {
      return 'c';
    } else if (b + c == a) {
      return 'a';
    } else {
      return '';
    }
  }
}