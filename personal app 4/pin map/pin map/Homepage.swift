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
    
    @EnvironmentObject var modelData: ModelData
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
                .navigationTitle("Brain States")
                .listStyle(.insetGrouped)
            } detail: {
                NavigationStack {
                    switch selection ?? .empty {
                    case .empty: Text("Select data to view.")
                   
                    case .brushing: InteractiveBrushing()

                    }
                }
                
            }
            .listStyle(.inset)
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct Brainview_Previews: PreviewProvider {
    static var previews: some View {
        Brainview()
            .environmentObject(ModelData())
    }
}

