public with sharing class StringListsPractice {
    
    public String concatenateList(List<String> words) { 
        String concatenatedWord = '';

        for(String word : words) {
            concatenatedWord += word;
        }

        return concatenatedWord;
    }

    public List<String> reverseWordsAndOrder_v1(List<String> words) {
        Loops_Exercise7 loops = new Loops_Exercise7();
        List<String> reversedWords = new List<String>();
        List<String> reversedOrderWords = new List<String>();
        String reversedWord = '';

        for(Integer i = words.size() - 1; i >= 0; i--){
            reversedOrderWords.add(words.get(i));
        }

        for(String word : reversedOrderWords){
            reversedWords.add(loops.reverseString(word));
        }

        return reversedWords;
    }

    public List<String> reverseWordsAndOrder_v2(List<String> words) {
        List<String> reversedWords = new List<String>();
        List<String> reversedOrderWords = new List<String>();

        for(Integer i = words.size() - 1; i >= 0; i--){
            reversedOrderWords.add(words.get(i));
        }

        for(String word : reversedOrderWords){
            String reversedWord = '';
        
            for(Integer i = word.length() - 1; i >= 0 ; i--) {
                reversedWord += word.split('').get(i);
            }

            reversedWords.add(reversedWord);
        }

        return reversedWords;
    }
}