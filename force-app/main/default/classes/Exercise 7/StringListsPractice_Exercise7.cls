public with sharing class StringListsPractice_Exercise7 {
    public String concatenateList(List<String> words) { 
        String concatenatedWord = '';

        for(String word : words) {
            concatenatedWord += word;
        }

        return concatenatedWord;
    }

    public List<String> reverseWordsAndOrder(List<String> words) {
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