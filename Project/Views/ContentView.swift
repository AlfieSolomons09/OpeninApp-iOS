//
//  ContentView.swift
//  Project
//
//  Created by Chetan Choudhary on 15/04/24.
//

import SwiftUI
import CoreData
import Foundation
import Combine
import UIKit


struct ContentView: View {
//    @ObservedObject var homeVM = HomeViewModel.shared
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
                        
                        LineChart()
                        
                        ViewAnalytics()
                        
                        Links()
                        
                        FAQS()
                    }
                }
                .padding(.bottom,10)
            }
        }
        
    }
        
}
 

#Preview {
    ContentView()
}


