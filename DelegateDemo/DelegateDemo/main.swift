protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("How may I help")
    }
    
    //when below method is called, it would be performed by the class which makes itself as the delegate
    func medicalEmergency(){
        delegate?.performCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self //making self as the delegate for the EmergencyHandler class -> delegate functions will be performed by this class
    }
    
    func performCPR() {
        print("Chest compressions started by Paramedic")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor performs CPR")
    }
    
    func useStethoscope(){
        print("Heartbeats!!")
    }
}

//here we inherit Doctor class and override the performCPR from Doctor class with our own implementation
class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Perform to the beats of Staying Alive")
    }
}


let emilio = EmergencyCallHandler()

let Shubham = Surgeon(handler: emilio)
//let Shubham = Paramedic(handler: emilio)
//let Shubham = Doctor(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
