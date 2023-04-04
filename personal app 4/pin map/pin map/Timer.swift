// Count down timer
// @Binding

import SwiftUI

struct TimerView: View {
  // Time remaining in seconds. The source of truth.
  @AppStorage("timeRemaining") var timeRemaining = 0
    
    @AppStorage("loop") var loop = 0
  
  // Flag for timer state.
  @State var timerIsRunning = false
  
  // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      // TimeDisplay view with data bindings.
      // NOTE: Syntax used for data bindings.
        TimeDisplay(timeRemaining: $timeRemaining, loop: $loop)
 //       Button("Pause",role: .destructive) {
            // Toggle timer on/off.
 //           self.timerIsRunning.toggle()
 //         }
        
      
      Button(action: {
        // Toggle timer on/off.
          self.timerIsRunning.toggle()
       
      }) {//appearance
          Text("Pause")
            .font(.system(size: 30))
            .frame(width: 160, height: 60)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(30)
       
      }
       
        Button(action: {
          // Toggle timer on/off.
          self.timerIsRunning.toggle()
          
          // If timer is not running, reset back to 60
          if !self.timerIsRunning {
            self.timeRemaining = 0
              self.loop = 0
              
         }
        }) {
          // Start / Stop Button
          Text(timerIsRunning ? "Reset" : "Start")
            .font(.system(size: 30))
            .frame(width: 160, height: 60)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(30)
        }
        
        
        
        
        
        
    }
    .onReceive(timer) { _ in
      // Block gets called when timer updates.
      
      // If timeRemaining and timer is running, count down.
      if self.timeRemaining > -1 && self.timerIsRunning {
        self.timeRemaining += 1
        
        print("Time Remaining:", self.timeRemaining)
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.white)
    .edgesIgnoringSafeArea(.all)
  }
}

struct TimeDisplay: View {
  // Binding variable.
  @Binding var timeRemaining: Int
    @Binding var loop: Int
  
  var body: some View {
    VStack {
      Text("\(timeRemaining)")
        .font(.system(size: 120))
        .foregroundColor(.black)
        
      Text("Tap on + to count the loop:")
        .foregroundColor(.black)
        .padding()
        
        Text("\(loop)")
          .font(.system(size: 80))
          .foregroundColor(.black)
        
        Image(systemName: "plus.square").resizable()
            .frame(width: 50, height: 50)
            .aspectRatio(contentMode: .fit)}.onTapGesture {
                // On tap gesture, increment timer by 10.
                self.loop += 1
              }
  }
}

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
      TimerView()
  }
}

// Source
// https://github.com/mobilelabclass/mobile-lab-timer-kit


