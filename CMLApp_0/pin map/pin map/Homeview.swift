/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct HomeView: View {
    
    @State var actname1 = ""
    @State var actname2 = ""
    @State var actname3 = ""
    let activity = "Activity name"
    
    var body: some View {
        
        
        VStack {
            Text("Activities")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
                Form{
        
                    TextField(activity, text: $actname1)
                    .padding()
                        .font(.title)
                        .padding([.bottom, .trailing], 10)
                        .border(.blue, width: 3)
                    
                    TextField(activity, text: $actname2)
                    .padding()
                        .font(.title)
                        .padding([.bottom, .trailing], 10)
                        .border(.blue, width: 3)
                    
                    TextField(activity, text: $actname2)
                    .padding()
                        .font(.title)
                        .padding([.bottom, .trailing], 10)
                        .border(.blue, width: 3)
                    
                }
                
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
