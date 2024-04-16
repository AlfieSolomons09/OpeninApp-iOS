//
//  FAQS.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import SwiftUI

struct FAQS: View {
    var body: some View {
        VStack(spacing: -10){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.green)
                        .frame(height: 76)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(hex:"#90EE90"))
                        .frame(height: 75)
                        .padding()
                    
                    HStack(spacing: 15){
                        Image(systemName: "message")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex:"#006c67"))
                        
                        Text("Talk with us")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 40)
                }
            })
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.blue)
                        .frame(height: 76)
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(hex:"#E8F1FF"))
                        .frame(height: 75)
                        .padding()
                    
                    HStack(spacing: 15){
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex:"#0E6FFF"))
                        
                        Text("Frequently Asked Questions")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 40)
                }
            })
            
            
            RoundedRectangle(cornerRadius: 1)
                .foregroundStyle(Color(hex: "#F5F5F5"))
                .frame(height: 400)
        }
    }
}

#Preview {
    FAQS()
}
