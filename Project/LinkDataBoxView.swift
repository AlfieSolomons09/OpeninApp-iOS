//
//  LinkDataBoxView.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import SwiftUI
import URLImage

struct LinkDataBoxView: View {
    let timestampString = "2023-03-09T08:00:05.000Z"
    let imageUrl = URL(string: "https://m.dailyhunt.in/assets/img/apple-touch-icon-72x72.png?mode=pwa&ver=2.0.76")
    let sampleLink = "Sample Link name..."
    
    var formattedDate: String {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd MMM yyyy"
            
            if let date = dateFormatterGet.date(from: timestampString) {
                return dateFormatterPrint.string(from: date)
            } else {
                return "Invalid date format"
            }
        }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.blue)
            
            VStack{
                HStack{
                    URLImage(imageUrl!) { image in
                        image.resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    
                    VStack(alignment:.leading, spacing: 10){
                        Text("\(sampleLink)")
                        Text(formattedDate)
                            .foregroundStyle(Color(hex: "#999CA0"))
                    }
                    .padding(.horizontal)
                    
                    VStack{
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LinkDataBoxView()
}
