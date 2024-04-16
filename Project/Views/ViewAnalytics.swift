//
//  ViewAnalytics.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import SwiftUI

struct ViewAnalytics: View {
    @State var today_clicks = 123
    @State var location = "Ahemdabad"
    @State var source = "Instagram"
    var body: some View {
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
                                    Text("\(today_clicks)")
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
                                    Text("\(location)")
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
                                    Text("\(source)")
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
}

#Preview {
    ViewAnalytics()
}
