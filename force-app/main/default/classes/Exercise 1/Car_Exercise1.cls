public with sharing class Car_Exercise1 {
    public String motor;
    public Integer maximumSpeed;
    public Integer passengers;
    public String color;
    public Boolean motorIsOn;
    public Radio_Exercise1 radio = new Radio_Exercise1();
    
    public Car_Exercise1(){
        maximumSpeed = 0;
        motorIsOn = true;
    }
    
    public Car_Exercise1(String motor, Integer maximumSpeed, Integer passengers, String color){
        this.motor = motor;
        this.maximumSpeed = maximumSpeed;
        this.passengers = passengers;
        this.color = color;
        motorIsOn = true;
    }
    
    public void printCarValues(){ 
        System.debug('This car has a ' + motor + ' motor, a maximum speed of ' 
            + maximumSpeed + ', holds up to ' + passengers + ' passengers, and is ' 
            + color + '. The motor is on: ' + motorIsOn + '\n The radio is a ' 
            + radio.radioType + ' and the frequency is set to ' + radio.frequency 
            + ' . The radio is on: ' + radio.isOn);
    }
    
    public void addSpeed(Integer speed){
        maximumSpeed += speed;
    }    
    
    public void repaint(String color){
        this.color = color;
    }
    
    public void toggleMotor(){
        motorIsOn = !motorIsOn;
    }
    
    public void assignRadio(Radio_Exercise1 radio){
        this.radio = radio;
    }

}