import SwiftUI
import CoreData
import Foundation
import Combine
import UIKit


struct ContentView: View {
    @ObservedObject var homeVM = HomeViewModel()
    @ObservedObject var networkManager = NetworkManager()
    @State var link = "Top Links"
    @State var name: String = "Ajay Manva"
    @State private var selectedTab = 0
    var body: some View {
        ZStack{
            Color(Color.blue).ignoresSafeArea(.container)
            VStack{
                HStack(spacing: 120){
                    Text("Dashboard")
                        .fontWeight(.semibold)
                        .font(.system(size: 32))
                        .foregroundStyle(Color.white)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(Color(hex: "#68BBE3"))
                                .frame(width: 45, height: 45)
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                        }
                    })
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color(hex: "#F5F5F5"))
                    ScrollView{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Good morning")
                                    .padding(.top,30)
                                    .padding(.leading)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(hex: "#999CA0"))
                                
                                Text("\(name) 👋")
                                    .padding(.leading)
                                    .padding(.top, 3)
                                    .font(.system(size: 32))
                            }
                            Spacer()
                        }
                        
                        LineChart(networkManager: networkManager)
                        
                        analytics
                        
                        links
                        
                        FAQS()
                    }
                }
                .padding(.bottom,10)
            }
        }
        .onAppear{
            networkManager.fetchDashboardData()
        }
        
    }
    
}


extension ContentView{
    var analytics: some View{
        VStack{
            ScrollView(.horizontal){
                HStack(spacing: 15){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 150)
                        
                        VStack{
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading)
                                        .padding(.bottom)
                                        .foregroundStyle(Color(hex:"#d6b4cf"))
                                    Image(systemName: "cursorarrow.click.2")
                                        .foregroundStyle(Color(hex: "#7F00FF"))
                                        .padding(.leading)
                                        .padding(.bottom)
                                }
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(networkManager.totalClicks)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                
                                Text("Today’s clicks")
                                    .foregroundStyle(Color(hex:"#999CA0"))
                            }
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 150)
                        
                        VStack{
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading)
                                        .padding(.bottom)
                                        .foregroundStyle(Color(hex:"#d0efff"))
                                    Image(systemName: "location")
                                        .foregroundStyle(Color(hex: "#0E6FFF"))
                                        .padding(.leading)
                                        .padding(.bottom)
                                }
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(networkManager.topLocation)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                
                                Text("Top Location")
                                    .foregroundStyle(Color(hex:"#999CA0"))
                            }
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 150)
                        
                        VStack{
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading)
                                        .padding(.bottom)
                                        .foregroundStyle(Color(hex:"#FFE9EC"))
                                    Image(systemName: "globe")
                                        .foregroundStyle(Color.red)
                                        .padding(.leading)
                                        .padding(.bottom)
                                }
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("\(networkManager.topSource)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                
                                Text("Top Source")
                                    .foregroundStyle(Color(hex:"#999CA0"))
                            }
                        }
                    }
                }
                .padding()
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color(hex:"#999CA0"))
                        .frame(height: 51)
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color(hex: "#F5F5F5"))
                        .frame(width: 359,height: 50)
                    HStack{
                        Image(systemName: "arrow.up.right")
                            .foregroundStyle(Color.black)
                        Text("View Analytics")
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.horizontal)
            })
        }
    }
    
    var links: some View{
        VStack{
            HStack{
                Button(action: {
                    link = "Top Links"
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundStyle(link == "Top Links" ? Color.blue : Color(hex: "#F5F5F5"))
                            .frame(width: 122, height: 41)
                        Text("Top Links")
                            .fontWeight(.semibold)
                            .foregroundStyle(link == "Top Links" ? Color.white : Color(hex: "#999CA0"))
                    }
                    .padding(.horizontal)
                })
                
                Button(action: {
                    link = "Recent Links"
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundStyle(link == "Recent Links" ? Color.blue : Color(hex: "#F5F5F5"))
                            .frame(width: 122, height: 41)
                        Text("Recent Links")
                            .foregroundStyle(link == "Recent Links" ? Color.white : Color(hex: "#999CA0"))
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 41, height: 41)
                            .foregroundStyle(Color.gray)
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color(hex: "#F5F5F5"))
                        
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.gray)
                    }
                })
                .padding(.horizontal)
            }
            
            if(link == "Top Links"){
                if !networkManager.recentLinks.isEmpty {
                    ForEach(0..<networkManager.recentLinks.count, id: \.self) { index in
                        let link = networkManager.recentLinks[index]
                        LinkDataBoxView(timestampString: link["created_at"] as? String ?? "", imageLink: link["original_image"] as? String ?? "", sampleLink: link["app"] as? String ?? "", clicks: link["total_clicks"] as? Int ?? 0, link: link["smart_link"] as? String ?? "")
                    }
                } else {
                    Text("Loading")
                }
            }
            else{
                if !networkManager.topLinks.isEmpty {
                    ForEach(0..<networkManager.recentLinks.count, id: \.self) { index in
                        let link = networkManager.topLinks[index]
                        
                        LinkDataBoxView(timestampString: link["created_at"] as? String ?? "", imageLink: link["original_image"] as? String ?? "", sampleLink: link["app"] as? String ?? "", clicks: link["total_clicks"] as? Int ?? 0, link: link["smart_link"] as? String ?? "")
                    }
                } else{
                    Text("Loading")
                }
            }
            
        }
    }
}


#Preview {
    ContentView()
}


