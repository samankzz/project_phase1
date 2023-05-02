import SwiftUI

func date(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

/// Data for the daily and monthly sales charts.
///

var arousal_s: [Double] = load("state_data.json")
var arousal = Matform(array:arousal_s)

struct SalesData {
    /// Sales by day for the last 30 days.
    
    static let ars =
    [
        (time: 1, state: 1),
        (time: 2, state: 3),
        (time: 3, state: 0),
        (time: 4, state: -1),
        (time: 5, state: 1),
        (time: 6, state: -2),
        (time: 7, state: 1),
        (time: 8, state: -2),
        (time: 9, state: 3),
        (time: 10, state: -2),
        (time: 11, state: 0),
        (time: 12, state: 2),
       (time: 13, state: -0.5)
    ]
   
 
}


func Matform(array: [Double]) -> [(Int,Double)]{
    let T_end = array.count-1

    var arousal_value: [(Int,Double)] = []
    
    for value in 0...T_end {
        arousal_value.append((value,array[value]))
    }
    return  arousal_value
}


