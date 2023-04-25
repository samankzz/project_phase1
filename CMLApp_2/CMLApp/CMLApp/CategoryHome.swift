import SwiftUI
import AVFoundation

struct Brainview: View {
    @State private var selection = 2
    var body: some View {
        
        NavigationView {
            CategoryHome()
        }
    }
}

struct CategoryHome: View {
    
   // @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    private enum Destinations {
        case empty
        case brushing

    }
    
    @State private var selection: Destinations?
    
    var body: some View {

        
        NavigationView {

            NavigationSplitView {
                List(selection: $selection) {
                   
                    Section() {
                       
                        NavigationLink("Arousal state", value: Destinations.brushing)
                    }
                }
                //.navigationTitle("CML App")
                .listStyle(.insetGrouped)
            } detail: {
                NavigationStack {
                    switch selection ?? .empty {
                    case .empty: Text("Select data to view.")
                   
                    case .brushing: InteractiveBrushing()

                    }
                }
                
            }
            
        }
    }
}
 

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .padding()
    }
}
