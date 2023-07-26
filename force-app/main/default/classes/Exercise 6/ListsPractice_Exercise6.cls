public with sharing class ListsPractice_Exercise6 {
    
    public Integer getRandomNumberInRange(Integer n, Integer m) {
        return n + (Integer)(Math.random() * ((m - n) + 1));
    }

    public List<String> getAllColors() {
        List<String> allColors = new List<String>();

        allColors.add('red');
        allColors.add('orange');
        allColors.add('yellow');
        allColors.add('green');
        allColors.add('blue');
        allColors.add('indigo');
        allColors.add('violet'); 

        return allColors;
    } 

    public String getRandomStringFromList(List<String> words) {
        return words.get(getRandomNumberInRange(0, words.size() - 1));
    }

    public List<String> mergeTwoStringListsAndSort(List<String> wordsOne, List<String> wordsTwo) {
        wordsOne.addAll(wordsTwo);
        wordsOne.sort();

        return wordsOne;
    }

    public List<String> getFirstNCharacters(String inputString, Integer n) {
        return inputString.left(n).split('');
    }

    public List<Integer> getListWithFiveRandomNumbers() {
        List<Integer> numbers = new List<Integer>();

        numbers.add(getRandomNumberInRange(0, 100));
        numbers.add(getRandomNumberInRange(0, 100));
        numbers.add(getRandomNumberInRange(0, 100));
        numbers.add(getRandomNumberInRange(0, 100));
        numbers.add(getRandomNumberInRange(0, 100));

        return numbers;
    }

    public Boolean isListSizeInRange(List<Integer> numbers, Integer n, Integer m) {
        Integer smallest = Math.min(n, m);
        Integer largest = Math.max(n, m);

        return numbers.size() >= smallest && numbers.size() <= largest;
    }
}