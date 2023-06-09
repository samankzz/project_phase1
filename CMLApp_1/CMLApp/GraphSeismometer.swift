/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct GraphSeismometer: View {
    @EnvironmentObject private var detector: MotionDetector
    @State private var data = [Double]()
    
    
    
    let maxData = 1000

    @State private var sensitivity = 0.0
    let graphMaxValueMostSensitive = 0.01
    let graphMaxValueLeastSensitive = 1.0

    var graphMaxValue: Double {
        graphMaxValueMostSensitive + (1 - sensitivity) * (graphMaxValueLeastSensitive - graphMaxValueMostSensitive)
    }

    var graphMinValue: Double {
        -graphMaxValue
    }
    var arousal_value = [1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
        4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
           4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594, 1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
            4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
     4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594, 1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
      4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594, 1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
            4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,
      -3.6213,   -2.8220 ,  -3.1786,   -4.5818 ,  -3.9306,    1.1644,    4.3966,   -1.4554 ,  -0.8937,    4.8435,    4.4558,    1.7664,    4.8830, 1.6238,   -2.5583,   -2.0449,    1.8018,    0.2785,   -0.8841,    1.0264,    2.5052,    0.8353,    0.5179,    0.8357,    0.1182,   -4.1741,    2.1957,    4.9616, -3.6213,   -2.8220 ,  -3.1786,   -4.5818 ,  -3.9306,    1.1644,    4.3966,   -1.4554 ,  -0.8937,    4.8435,    4.4558,    1.7664,    4.8830, 1.6238,   -2.5583,   -2.0449,    1.8018,    0.2785,   -0.8841,    1.0264,    2.5052,    0.8353,    0.5179,    0.8357,    0.1182,   -4.1741,    2.1957,    4.9616,-3.6213,   -2.8220 ,  -3.1786,   -4.5818 ,  -3.9306,    1.1644,    4.3966,   -1.4554 ,  -0.8937,    4.8435,    4.4558,    1.7664,    4.8830, 1.6238,   -2.5583,   -2.0449,    1.8018,    0.2785,   -0.8841,    1.0264,    2.5052,    0.8353,    0.5179,    0.8357,    0.1182,   -4.1741,    2.1957,    4.9616, -3.6213,   -2.8220 ,  -3.1786,   -4.5818 ,  -3.9306,    1.1644,    4.3966,   -1.4554 ,  -0.8937,    4.8435,    4.4558,    1.7664,    4.8830, 1.6238,   -2.5583,   -2.0449,    1.8018,    0.2785,   -0.8841,    1.0264,    2.5052,    0.8353,    0.5179,    0.8357,    0.1182,   -4.1741,    2.1957,    4.9616, 3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
                         4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594, 1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
                          4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,   -2.2493,   -2.5137,   -0.4836,   -2.7229,    3.0445,
                   4.8610,   -4.7001,    0.3566,   -4.1292,    3.0209,    4.8914,   -4.3305,    4.3940,   -4.8182,    1.8384,    2.8374,    0.3414,    3.8536,    3.9900,    1.2594,1.2735,   -4.7835,    4.1057,    3.0056,    2.4585,    3.1311,   -1.1669,    1.1728,    0.7549,    0.3005,]
    
    

    var body: some View {
        VStack {
            Spacer()
            LineGraph(data: data, maxData: maxData, minValue: -10, maxValue: 10)
                .clipped()
                .background(Color.accentColor.opacity(0.1))
                .cornerRadius(20)
                .padding()
                .aspectRatio(1, contentMode: .fit)
            
            Spacer()
            
            Text("Sensitivity")
                .font(.headline)
            
            Slider(value: $sensitivity, in: 0...1, minimumValueLabel: Text("Min"), maximumValueLabel: Text("Max")) {
                Text("Sensitivity")
            }
            .padding()
            
            Spacer()
            
            Text("Set your device on a flat surface to record vibrations using its motion sensors.")
                .padding()
            
            Spacer()
        }
        .onAppear {
            
            detector.onUpdate = {
                for newdata in arousal_value {
                    let seconds = 4.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        // Put your code which should be executed with a delay here
                        data.append(newdata)
                    }
                    
                }
                if data.count > maxData {
                    data = Array(data.dropFirst())
                }
            }
        }
    }
}

struct GraphSeismometer_Previews: PreviewProvider {
    @StateObject static private var detector = MotionDetector(updateInterval: 0.01).started()

    static var previews: some View {
        GraphSeismometer()
            .environmentObject(detector)
    }
}

