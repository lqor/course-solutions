public with sharing class ListsPractice_Exercise7 {
    public Integer sumList(List<Integer> numbers) {
        Integer sum = 0;

        for(Integer num : numbers) {
            sum += num;
        }

        return sum;
    }

    public Integer getSmallest(List<Integer> numbers) {
        /* alternative solution */
        //integerList.sort();
        //return integerList.get(0);

        Integer smallest = numbers.get(0);
    
        for(Integer num : numbers) {
            if(num < smallest) {
                smallest = num;
            }
        }

        return smallest;
    }

    public List<Integer> createNIntegers(Integer n) {
        List<Integer> numbers = new List<Integer>();

        for(Integer i = 0; i < n; i++) {
            numbers.add(getRandomNumberInRange(0, 100));
        }

        return numbers;
    }

    public Integer getRandomNumberInRange(Integer n, Integer m) {
        return n + (Integer)(Math.random() * ((m - n) + 1));
    }

    public String getRandomStringFromList(List<String> words) {
        return words.get(getRandomNumberInRange(0, words.size() - 1));
    }
}
