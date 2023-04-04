/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI
import Foundation
import Charts


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct MonthlyHoursOfSunshine:Identifiable {
    var time: Double
    var hoursOfSunshine: Double
    let id = UUID()

    init(time: Double, hoursOfSunshine: Double)
    
    {

        self.time = time
        self.hoursOfSunshine = hoursOfSunshine
    }
}

var data: [MonthlyHoursOfSunshine] = [
    MonthlyHoursOfSunshine(time: 1, hoursOfSunshine: 74),
    MonthlyHoursOfSunshine(time: 2, hoursOfSunshine: 79),
    MonthlyHoursOfSunshine(time: 2, hoursOfSunshine: 209),
    // ...
    MonthlyHoursOfSunshine(time: 12, hoursOfSunshine: 62)
]




struct EDAGraph: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("time index", $0.time),
                y: .value("Hours of Sunshine", $0.hoursOfSunshine)
            )
        }
    }

}



struct EDAGraph_Previews: PreviewProvider {
    static var previews: some View {
        EDAGraph()
        }
    }


