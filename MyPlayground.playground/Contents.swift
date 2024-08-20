//Basic struct
//struct Town { //create a structure by name Town
//    let name = "RandomTown" //constant
//    var citizens = ["Shubham", "Dhama"] //array
//    var resources = ["Steel": 100, "Food": 200, "Wood": 300] //dictionary
//
//    func fortify() { //methods in struct
//        print("Defense increased")
//    }
//}
//
//var myTown = Town() //call the structure
//
//print(myTown.citizens)
//print("\(myTown.name) has \(myTown.resources["Steel"]!) counts of Steel") //unwrapping the optional in string interpolation since dictionary output is optional
//
//myTown.citizens.append("Homelander") //add data to var property
//print(myTown.citizens)
//
//myTown.fortify()

//With init
struct Town { //create a structure by name Town
    let name: String //constant
    var citizens: [String] //array
    var resources: [String: Int] //dictionary
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }

    
    func fortify() { //methods in struct
        print("\(name) Defense increased")
    }
    
    mutating func harvestRice(){ //mutating functions
        resources["Rice"] = 100 //Error if mutating is not added: Cannot assign through subscript: 'self' is immutable
    }
}

//Initializing two objects using same structure
var dTown = Town(name: "DhamaTown", citizens: ["Shubham", "Dhama"], resources: ["Milk": 200]) //call the structure and initialize using init parameters
var ghostTown = Town(name: "GhostTown", citizens: [], resources: ["Emptiness": 100])

print(dTown.citizens)
ghostTown.fortify()
dTown.harvestRice()
print(dTown.resources)
