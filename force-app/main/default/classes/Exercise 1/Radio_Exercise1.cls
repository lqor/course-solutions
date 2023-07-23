public with sharing class Radio_Exercise1 {
    public Decimal frequency;
    public String radioType;
    public Boolean isOn;
    
    public Radio_Exercise1(){
        frequency = 135.5;
        radioType = 'Sony DSX-A110U';
        isOn = true;
    }
    
    public Radio_Exercise1(String radioType){
        frequency = 135.5;
        this.radioType = radioType;
        isOn = true;
    }
    
    public Decimal nextChannel(){
        return frequency += 10;
    }
}