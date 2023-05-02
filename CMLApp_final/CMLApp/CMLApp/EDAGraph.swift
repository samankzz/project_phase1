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

struct state_time_mat:Identifiable {
    var time: Double
    var state_val: Double
    let id = UUID()

    init(time: Double, state_val: Double)
    
    {

        self.time = time
        self.state_val = state_val
    }
}

var aroussal_state: [Double] = load("state_data.json")

var T_end = aroussal_state.count
var Time = 0...T_end



var data: [state_time_mat] = [
    state_time_mat(time: 1, state_val: aroussal_state[1]),
    state_time_mat(time: 2, state_val: aroussal_state[2]),
    state_time_mat(time: 2, state_val: aroussal_state[3]),
    // ...
    state_time_mat(time: 12, state_val: aroussal_state[12])
]




struct EDAGraph: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("time index", $0.time),
                //y: .value("Sales", $0.aroussal_state)
                y: .value("arousal state", $0.state_val)
            )
        }
    }

}






struct EDAGraph_Previews: PreviewProvider {
    static var previews: some View {
        EDAGraph()
        }
    }



    
  //  for value in array[1...T_end] {
   //     Matform[v] =  MonthlyHoursOfSunshine(time: Time_ind[value], hoursOfSunshine: array[value])
  //  }


