//
//  Links.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import SwiftUI

struct Links: View {
    @State var link = "Top Links";
    var body: some View {
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
            ForEach(0..<5){_ in
                LinkDataBoxView(imageLink: "https://www.youtube.com/img/desktop/yt_1200.png")
            }
        }
        else{
            ForEach(0..<5){_ in
                LinkDataBoxView()
            }
        }
    }
}

#Preview {
    Links()
}
