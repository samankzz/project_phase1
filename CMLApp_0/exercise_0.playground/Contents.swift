import UIKit

// create arrays
let evenNumbers = [2, 4, 6, 8, 10]
let twoLetterWords = ["up", "go", "me", "we"]
let names = ["John", "James", "Theodore"]

// get index
let greaterThan3 = evenNumbers.firstIndex(where: {$0 > 3})!

let e = "we"
let we1 = twoLetterWords.firstIndex(of: "we")!
let we2 = twoLetterWords.firstIndex(where: {$0 == "we"})!
let myName = names.firstIndex(where: {$0 == "Theodore"})!

// print results
print(greaterThan3) // 1 = second element
print(we1)           // 3 = fourth element
print(we2)           // 3 = fourth element
print(myName)       // 2 = third element


// what does the below code mean?
var numbers = [5, 4, 2 ,8, 6, 7]
let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

// how to find a certain array element in a swift code that has certain values?

// what do these lines do?
//player?.numberOfLoops = -1
//player?.play()
//bundleAudio.count
