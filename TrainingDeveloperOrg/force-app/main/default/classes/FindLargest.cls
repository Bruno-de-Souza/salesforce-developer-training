public with sharing class FindLargest {
    public static Integer FindLargest(Integer num1, Integer num2, Integer num3) {
        List<Integer> theLargest = new List<Integer>{num1, num2, num3};
        theLargest.sort();
        return theLargest.get(theLargest.size()-1);
    }
}