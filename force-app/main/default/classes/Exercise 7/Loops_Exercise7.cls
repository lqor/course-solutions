public with sharing class Loops_Exercise7 {
    
    public String reverseString(String word) {
        String reversedWord = '';
        
        for(Integer i = word.length() - 1; i >= 0 ; i--) {
            reversedWord += word.split('').get(i);
        }
        
        return reversedWord;
    }
}