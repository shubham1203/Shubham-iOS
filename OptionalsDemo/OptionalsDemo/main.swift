let myOptional: String?
myOptional = nil
var textString: String

//method 1: Force Unwrap
//textString = myOptional!

//method 2: Check for nil
if myOptional != nil {
    textString = myOptional!
    print(textString)
}else {
    print("No Value")
}

//method 3: Optional Binding -> Same as above, using if let, myOptionalSafe automatically unwraps
if let myOptionalSafe = myOptional {
    textString = myOptionalSafe
    print(textString)
}else {
    print("No Value")
}

//method 4: Nil Coalescing Operator -> Provide a default value if optional is nil
textString = myOptional ?? "Default Optional Value"
print(textString)

//method 5: Optional Chaining -> When structs or classes are declared as optionals
struct MyOptional {
    let property = "123"
    
    func method() {
        print("Method within the struct")
    }
}

let myOptionalStruct: MyOptional? //declaring constant of type MyOptional with optional

myOptionalStruct = MyOptional() //Struct assigned values in form of other structure

//Optional Chaining starts -> If nil is provided in above assignment, below lines would return nil
print(myOptionalStruct?.property)
myOptionalStruct?.method()

