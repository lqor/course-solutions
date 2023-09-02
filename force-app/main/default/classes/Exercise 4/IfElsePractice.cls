public with sharing class IfElsePractice {
    
    public void printSign(Integer num) {
        if(num < 0) {
            System.debug('negative');
        } else if(num > 0) {
            System.debug('positive');
        } else {
            System.debug('zero');
        }
    }
    
    public void hasNLength(String input, Integer n) {
        if(input.length() >= n){
            System.debug('valid');
        } else {
            System.debug('invalid');
        }
    }

    public Boolean hasExactLength(String input, Integer n) {
        return input.length() == n;
    }

    public Integer maximumNumber(Integer number1, Integer number2) {
        return Math.max(number1, number2);
    }

    public Integer maximumNumber(Integer number1, Integer number2, Integer number3) {
        return Math.max(number1, Math.max(number2, number3));
    }

    public Boolean isEven(Integer num) {
        return Math.mod(num, 2) == 0;
    }

    public Decimal convertTemperature(Decimal temperature, String unit) {
        if(unit == 'C') {
            return ((temperature * 9 / 5) + 32);
        } else if(unit == 'F') {
            return ((temperature - 32) * 5 / 9);
        } else {
            return 0;
        }
    }
}