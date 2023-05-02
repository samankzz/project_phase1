/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Interactive Brushing definitions.
*/

import SwiftUI
import Charts

struct InteractiveBrushingChart: View {
    @Binding var range: (Date, Date)?
  
    

    var body: some View {
        Chart {
            ForEach(SalesData.ars, id: \.time) {
                LineMark(
                    x: .value("time", $0.time),
                    y: .value("Arousal", $0.state)
                )
                .interpolationMethod(.catmullRom)
                .symbol(Circle().strokeBorder(lineWidth: 2))
            }
   
        }
        .chartOverlay { proxy in
            GeometryReader { nthGeoItem in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .gesture(DragGesture()
                        .onChanged { value in
                            // Find the x-coordinates in the chart’s plot area.
                            _ = value.startLocation.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                            _ = value.location.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                            // Find the date values at the x-coordinates.
                       
                        }
                        .onEnded { _ in range = nil } // Clear the state on gesture end.
                    )
            }
        }
    }
}

struct InteractiveBrushing: View {
    @State private var range: (Date, Date)? = nil



    var isBrushing: Bool {
        range != nil 
    }

    var body: some View {
        List {
            VStack(alignment: .leading) {
                
                Text(
                    isBrushing
                    ? "Arousal state"
                    : "Arousal state"
                )
                .font(.title2.bold())

                InteractiveBrushingChart(range: $range)
                    .frame(height: 240)
                    .padding(.bottom)

                
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct InteractiveBrushingChart_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveBrushing()
            .padding()
    }
}

