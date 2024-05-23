import SwiftUI

struct InitialView: View {
    @State private var selectedTab = 0
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack {
                            
                TabView(selection: $selectedTab) {
                        ContentView()
                        .frame(maxHeight: .infinity)
                        .padding(.bottom, 70)
                            .ignoresSafeArea()
                            .tabItem {
                                Label("Links", systemImage: "link")
                            }
                            .tag(0)
                                
                        Text("Course")
                            .tabItem {
                                Label("Course", systemImage: "book")
                            }
                            .tag(1)
                    
                        Text("Campaigns")
                            .tabItem {
                                Label("Campaigns", systemImage: "speaker")
                            }
                            .tag(2)
                        
                        Text("Profile")
                            .tabItem {
                                Label("Profile", systemImage: "person")
                            }
                            .tag(3)
                        }
                        .background(Color.white.edgesIgnoringSafeArea(.all))
                }
            .padding(.top)
        }
    }
}

#Preview {
    InitialView()
}
