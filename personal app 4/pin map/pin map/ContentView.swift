/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CategoryHome()
                .environmentObject(ModelData())
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
            
            EDADetail()
                .tabItem {
                    Label("Signal", systemImage: "waveform.path.ecg.rectangle.fill")
                }
            
        
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
