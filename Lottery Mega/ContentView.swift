//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            MegaMillionView()
                .tabItem {
                    VStack {
                        Image(systemName: "number.circle.fill")
                        
                        Text("Mega Millionz")
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
