/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    
    @StateObject private var detector = MotionDetector(updateInterval: 0.01)
    
    var aroussal_state: [Double] = load("state_data.json")
    

    var body: some View {
        VStack {
            Text("CML App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TabView {
                CategoryHome()
                //.environmentObject(ModelData())
                    .tabItem {
                        Label("State", systemImage: "brain.head.profile")
                    }
                
                //MapView()
                // .tabItem {
                //Label("Course", systemImage: "map")
                //}
                
                
                
                // TimerView()
                // .tabItem {
                // Label("Timer", systemImage: "timer")
                //}
                
                GraphSeismometer()
                    .environmentObject(detector)
                    .onAppear() {
                        detector.start()
                    }
                    .onDisappear {
                        detector.stop()
                    }
                    .tabItem {
                        Label("Online Signal", systemImage: "waveform.path.ecg.rectangle")
                    }
                
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
