//
//  ContentView.swift
//  Swift Tour
//
//  Created by Jeff Holmes on 3/20/20.
//  Copyright © 2020 Jeff Holmes. All rights reserved.
//

import SwiftUI

func simpleValues() {
    // Use let to make a constant and var to make a variable.
    // A constant or variable must have the same type as the value you want to assign to it.
    // The value of a constant does not need to be known at compile time,
    // but you must assign it a value exactly once.
    
    // The compiler infers that myVariable is an integer because its initial value is an integer.
    var myVariable = 42
    myVariable = 50
    
    let myConstant = 42
    
    let implicitInteger = 70
    let implicitDouble = 70.0
    let explicitDouble: Double = 70
    
    
    // Values are never implicitly converted to another type.
    // If you need to convert a value to a different type, explicitly make an instance of the desired type.
    let label = "The width is "
    let width = 94
    let widthLabel = label + String(width)

    // There is an simpler way to include values in strings: Write the value in parentheses,
    // and write a backslash before the parentheses.
    let apples = 3
    let oranges = 5
    let appleSummary = "I have \(apples) apples."
    let fruitSummary = "I have \(apples + oranges) pieces of fruit."

    let name = "Jeff"
    let sCalculation = "I have \(implicitDouble)"
    let greeting = "Hello \(name)"

    // Use three double quotation marks (""") for strings that take up multiple lines.
    // Indentation at the start of each quoted line is removed, as long as it matches
    // the indentation of the closing quotation marks.
    // let quotation = """
    // I said "I have \(apples) apples."
    // And then I said "I have \(apples + oranges) pieces of fruit."
    // """
    
    // Create arrays and dictionaries using brackets, and access their elements
    // by writing the index or key in brackets. A comma is allowed after the last element.
    var shoppingList = ["catfish", "water", "tulips"]
    shoppingList[1] = "bottle of water"

    var occupations = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
    ]
    occupations["Jayne"] = "Public Relations"
    print(occupations)

    // Arrays automatically grow as you add elements.
    shoppingList.append("blue paint")
    print(shoppingList)
    
    // To create an empty array or dictionary, use the initializer syntax.
    let emptyArray = [String]()
    let emptyDictionary = [String: Float]()
    
    // If type information can be inferred, you can write an empty array as []
    // and an empty dictionary as [:], e.g. when you set a new value for a variable
    // or pass an argument to a function.
    shoppingList = []
    occupations = [:]
}

func controlFlow() {
    // Use if and switch to make conditionals, and use for-in, while, and repeat-while to make loops.
    // Parentheses around the condition or loop variable are optional. Braces around the body are required.
    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0

    for score in individualScores {
        // In an if statement, the conditional must be a Boolean expression.
        // This means that code such as if score { ... } is an error, not an implicit comparison to zero.
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)
    // Prints "11"


    // You can use if and let together to work with values that might be missing.
    // These values are represented as optionals. An optional value either contains a value
    // or contains nil to indicate that a value is missing.
    // Write a question mark (?) after the type of a value to mark the value as optional.
    var optionalString: String? = "Hello"
    print(optionalString == nil)
    // Prints "false"

    var optionalName: String? = "John Appleseed"
    var greeting = "Hello!"
    
    // If the optional value is nil, the conditional is false and the code in braces is skipped.
    // Otherwise, the optional value is unwrapped and assigned to the constant after let
    // which makes the unwrapped value available inside the block of code.
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    
    
    // Another way to handle optional values is to provide a default value using the ?? operator.
    // If the optional value is missing, the default value is used instead.
    let nickName: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
    

    // Switches support any kind of data and a wide variety of comparison operations:
    // they aren not limited to integers and tests for equality.

    let vegetable = "red pepper"
    
    switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        // Notice how let can be used in a pattern to assign the value that matched the pattern to a constant.
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
    }
    // Prints "Is it a spicy red pepper?"

    
    // You use for-in to iterate over items in a dictionary by providing a pair of names
    // to use for each key-value pair. Dictionaries are an unordered collection
    // so their keys and values are iterated over in an arbitrary order.
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    var largest = 0
    
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
            }
        }
    }
    
    print(largest)
    // Prints "25"
    
    
    
    // Use while to repeat a block of code until a condition changes.
    // The condition of a loop can be at the end instead, ensuring that the loop is run at least once.

    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)
    // Prints "128"

    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print(m)
    // Prints "128"
    
    
    // You can keep an index in a loop by using ..< to make a range of indexes.
    // Use ..< to make a range that omits its upper value, and use ... to make a range that includes both values.
    var total = 0
    for i in 0...4 {
        print(i)
    }
    // Prints "0 1 2 3 4"

}


// Use func to declare a function. Call a function by following its name with a list of arguments in parentheses.
// Use -> to separate the parameter names and types from the function’s return type.
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

// By default, functions use their parameter names as labels for their arguments.
// Write a custom argument label before the parameter name or _ to use no argument label.
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

// Use a tuple to make a compound value: e.g. to return multiple values from a function.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}


// Use class followed by the class’s name to create a class.
// A property declaration in a class is written the same way as a constant or variable declaration
// except that it is in the context of a class. Likewise, method and function declarations are written the same way.
class Shape {
    var numberOfSides = 0
    let myConstant = 42
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    // Every property needs a value assigned—either in its declaration (as with numberOfSides)
    // or in the initializer (as with name).
    
    // Use init to create an initializer to set up the class when an instance is created.
    // Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
    init(name: String) {
        // Notice how self is used to distinguish the name property from the name argument to the initializer.
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// Subclasses include their superclass name after their class name, separated by a colon.
// Methods on a subclass that override the superclass’s implementation are marked with override
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

// In addition to simple properties that are stored, properties can have a getter and a setter.
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        // In the setter for perimeter, the new value has the implicit name newValue.
        // You can provide an explicit name in parentheses after set.
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}


// This class ensures that the side length of its triangle is always the same as the side length of its square.
// If you do not need to compute the property but still need to provide code that is run before and after
// setting a new value, use willSet and didSet. The code you provide is run any time the value changes
// outside of an initializer.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

// Use enum to create an enumeration.
// Like classes and all other named types, enumerations can have methods associated with them.
// You can also use strings or floating-point numbers as the raw type of an enumeration.
enum Rank: Int {
    // By default, Swift assigns the raw values starting at zero and incrementing by one each time,
    // but you can change this behavior by explicitly specifying values.
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        // Inside the switch, the enumeration case is referred to by the abbreviated form
        // .hearts because the value of self is already known to be a suit.
        switch self {
            case .spades:
                return "Description: spades"
            case .hearts:
                return "Description: hearts"
            case .diamonds:
                return "Description: diamonds"
            case .clubs:
                return "Description: clubs"
        }
    }
}

// If an enumeration has raw values, those values are determined as part of the declaration
// which means every instance of a particular enumeration case always has the same raw value.
// Another choice for enumeration cases is to have values associated with the case—these values
// are determined when you make the instance, and they can be different for each instance of an enumeration case.
// You can think of the associated values as behaving like stored properties of the enumeration case instance.
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

// Structures support many of the same behaviors as classes, including methods and initializers.
// One of the most important differences between structures and classes is that structures are
// always copied when they are passed around in your code, but classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}


// Use protocol to declare a protocol.
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations, and structs can all adopt protocols.
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    // Notice the use of the mutating keyword to mark a method that modifies the structure.
    // The declaration of SimpleClass doesn’t need any of its methods marked as mutating
    // because methods on a class can always modify the class.
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

// Use extension to add functionality to an existing type, such as new methods and computed properties.
// You can use an extension to add protocol conformance to a type that is declared elsewhere or
// even to a type that you imported from a library or framework.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}


// You represent errors using any type that adopts the Error protocol.
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Use throw to throw an error and throws to mark a function that can throw an error.
// If you throw an error in a function, the function returns immediately and the code
// that called the function handles the error.
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

// Use defer to write a block of code that is executed after all other code in the function,
// just before the function returns. The code is executed regardless of whether the function throws an error.
// You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}


// Write a name inside angle brackets to make a generic function or type.
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

// You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

// Use where right before the body to specify a list of requirements:
// e.g. to require the type to implement a protocol, to require two types to be the same,
// or to require a class to have a particular superclass.
// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}


extension View {
    // Right-click in Preview to select run as "Debug Preview".
    func Print(_ vars: Any...) -> some View {
        #if DEBUG
            // print("debug...")
            for v in vars { print(v) }
        #endif
        return EmptyView()
    }
    
    // Simple Values
    func Simple(_ vars: Any...) -> some View {
        simpleValues()
        return EmptyView()
    }

    // Control Flow
    func ControlFlow(_ vars: Any...) -> some View {
        controlFlow()
        return EmptyView()
    }

    // Functions and Closures
    func Functions(_ vars: Any...) -> some View {
        var greeting = greet(person: "Bob", day: "Tuesday")
        print(greeting)

        greeting = greet2("John", on: "Wednesday")
        print(greeting)

        // The elements of a tuple can be referred to either by name or by number.
        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
        print(statistics.sum)
        // Prints "120"
        print(statistics.2)
        // Prints "120"

        var numbers = [20, 19, 7, 12]
        hasAnyMatches(list: numbers, condition: lessThanTen)

        // Functions are actually a special case of closures: blocks of code that can be called later.
        numbers.map({ (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        
        return EmptyView()
    }
    
    // Objects and Classes
    func Objects(_ vars: Any...) -> some View {
        // Create an instance of a class by putting parentheses after the class name.
        // Use dot syntax to access the properties and methods of the instance.
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescription()
        
        let test = Square(sideLength: 5.2, name: "my test square")
        print("Area: \(test.area())")
        print("Decription: \(test.simpleDescription())")
        
        var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
        print("triangle.perimeter: \(triangle.perimeter))")
        // Prints "9.3"
        triangle.perimeter = 9.9
        print("triangle.sideLength: \(triangle.sideLength))")

        var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
        print("square.sideLength: \(triangleAndSquare.square.sideLength))")
        // Prints "10.0"
        print("triangle.sideLength: \(triangleAndSquare.triangle.sideLength))")
        // Prints "10.0"
        triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
        print("triangle.sideLength: \(triangleAndSquare.triangle.sideLength))")
        // Prints "50.0"

        // When working with optional values, you can write ? before operations like methods, properties, and subscripting.
        // If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil.
        // Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value.
        // In both cases, the value of the whole expression is an optional value.
        let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
        let sideLength = optionalSquare?.sideLength
        
        return EmptyView()
    }
    
    // Enumerations and Structures
    func Enums(_ vars: Any...) -> some View {
        let ace = Rank.ace
        let aceRawValue = ace.rawValue
        
        // Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
        // It returns either the enumeration case matching the raw value or nil if there is no matching Rank.
        if let convertedRank = Rank(rawValue: 3) {
            let threeDescription = convertedRank.simpleDescription()
        }

        let hearts = Suit.hearts
        let heartsDescription = hearts.simpleDescription()
        print(hearts)
        print(heartsDescription)
        
        // Consider the case of requesting the sunrise and sunset times from a server.
        // The server either responds with the requested information, or it responds with a description of what went wrong.
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("Out of cheese.")

        switch success {
            case let .result(sunrise, sunset):
                print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
            case let .failure(message):
                print("Failure...  \(message)")
        }
        // Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."
        
        let threeOfSpades = Card(rank: .three, suit: .spades)
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
        print(threeOfSpades)
        print(threeOfSpadesDescription)
        
        return EmptyView()
    }
    
    // Protocols and Extensions
    func Protocols(_ vars: Any...) -> some View {
        var a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription

        var b = SimpleStructure()
        b.adjust()
        let bDescription = b.simpleDescription

        print(7.simpleDescription)
        // Prints "The number 7"

        // You can use a protocol name just like any other named type: e.g. to create a collection of objects
        // that have different types but that all conform to a single protocol. When you work with values whose type
        // is a protocol type, methods outside the protocol definition are not available.
        let protocolValue: ExampleProtocol = a
        print(protocolValue.simpleDescription)
        // "A very simple class.  Now 100% adjusted."
        
        // Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it
        // as the given type of ExampleProtocol. This means that you cannot accidentally access methods or
        // properties that the class implements in addition to its protocol conformance.
        // print(protocolValue.anotherProperty)  // Uncomment to see the error
        
        return EmptyView()
    }
    
    // Error Handling
    func ErrorHandling(_ vars: Any...) -> some View {
        // There are several ways to handle errors. One way is to use do-catch.
        // You can provide multiple catch blocks that handle specific errors.
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        // Prints "Job sent"

        // Another way to handle errors is to use try? to convert the result to an optional.
        // If the function throws an error, the specific error is discarded and the result is nil.
        // Otherwise, the result is an optional containing the value that the function returned.
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        
        
        // Use defer to write a block of code that is executed after all other code in the function.
        fridgeContains("banana")
        print(fridgeIsOpen)
        // Prints "false"
        
        return EmptyView()
    }

    // Generics
    func Generics(_ vars: Any...) -> some View {
        var array = makeArray(repeating: "knock", numberOfTimes: 4)
        print(array)
        
        var possibleInteger: OptionalValue<Int> = .none
        possibleInteger = .some(100)
        print(possibleInteger)
        
        var bool = anyCommonElements([1, 2, 3], [3])
        print(bool)
        
        return EmptyView()
    }

}

struct ContentView: View {
    var body: some View {
        Group {
            Text("Hello, World!")
            Print("\nBegin:")
            Simple()
            // ControlFlow()
            // Functions()
            // Objects()
            // Enums()
            // Protocols()
            // ErrorHandling()
            //Generics()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
