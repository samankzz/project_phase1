/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

struct EDADetail: View {
   
    var buttons = [
        ("Electrodermal Activity"),
        //("Heart Rate", \Hike.Observation.heartRate),
        //("Pace", \Hike.Observation.pace)
    ]

    var body: some View {
        VStack {
            EDAGraph()
                .frame(height: 200)
            Text("EDA signal ")

        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EDADetail()
    }
}

