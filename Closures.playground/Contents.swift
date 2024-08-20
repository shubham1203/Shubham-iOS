//passing function as parameter to the function
func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) {
    operation(n1, n2)
}

//creating functions with similar structure as required above
func multiply (n1: Int, n2: Int) -> Int {
    return n1 * n2
}

func add (n1: Int, n2: Int) -> Int {
    return n1 + n2
}

calculator(n1: 5, n2: 2, operation: multiply)


//Closures are used to shorten such functions -> Passed directly as input param to the function call
//{ (n1: Int, n2: Int) -> Int in
//    return n1 * n2
//}

calculator(n1: 5, n2: 2, operation: { (n1: Int, n2: Int) -> Int in
    return n1 * n2
})

//further shorten -> Type inference in Swift -> Swift recognizes input type so we can remove Int, also swift knows return type will be Int, so that can be removed too
calculator(n1: 5, n2: 2, operation: { (n1, n2) in
    return n1 * n2
})

//further shorten -> remove return keyword since we are inside a closure and compiler can infer something is being processed
calculator(n1: 5, n2: 2, operation: { (n1, n2) in
    n1 * n2
})

//further shorten -> we can use anonymous parameter names -> We can assign $0 for first param, $1 for 2nd and so on
calculator(n1: 5, n2: 2, operation: { $0 * $1 })

//further shorten -> If last param is a closure, we can omit param name, close the brackets before and add it as a trailing closure
calculator(n1: 5, n2: 2) { $0 * $1 }

//Example Usage
let array = [6,2,3,9,4,1]

func addOne(n1: Int) -> Int {
    return n1 + 1
}

let arrayFunc =  array.map(addOne)
print(arrayFunc)

//using closures
let arrayClosure = array.map {$0 + 1}
print(arrayClosure)

//Converting the array to Strings using closure
let arrayString = array.map { "\($0)" }
print(arrayString)
