//Protocol CanFly has one method and has no body present for the method
protocol CanFly {
    func fly()
}

//Bird consists of only basic bird functions which are conformed by both Eagle and Penguin
class Bird {
    
    var isFemale = true
    
    func layEggs (){
        if isFemale {
            print("Eggs for breakfast!!")
        }
    }
}

//Penguin has additional method canSwim
class Penguin: Bird {
    func canSwim(){
        print("Birds in the water")
    }
}

//Eagls conforms to protocol CanFly and has fly method defined
class Eagle: Bird, CanFly {
    func fly() {
        print("Eagle flies in the sky")
    }
}

//Aeroplane conforms to CanFly and has fly method defined
struct Airplane: CanFly {
    func fly() {
        print("Aeroplane is flying!!")
    }
}

//protocols can be used in params to define objects using that protocol to be passed as params
struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myPlane = Airplane()
let myMuseum = FlyingMuseum()

myEagle.layEggs()
myEagle.fly()

myPenguin.layEggs()
//myPenguin.fly() -> Error

myPlane.fly()

myMuseum.flyingDemo(flyingObject: myEagle)
myMuseum.flyingDemo(flyingObject: myPlane)
//myMuseum.flyingDemo(flyingObject: myPenguin) -> Error
