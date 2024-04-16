//
//  LinkDataBoxView.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import SwiftUI
import URLImage
import UIKit


struct LinkDataBoxView: View {
    let timestampString = "2023-03-09T08:00:05.000Z"
    @State var imageLink = "https://m.dailyhunt.in/assets/img/apple-touch-icon-72x72.png?mode=pwa&ver=2.0.76"
    let sampleLink = "Sample Link name..."
    let clicks = 2323
    @State var link = "https://inopenapp.com/estt3"
    
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
    
    func copyToClipboard(text: String) {
            UIPasteboard.general.string = text
        }
    
    var body: some View {
        let imageUrl = URL(string: imageLink)
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
                .frame(height: 140)
                .padding(4)
            
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
                    
                    Spacer()
                    
                    VStack(spacing:10){
                        Text("\(clicks)")
                            .fontWeight(.semibold)
                        Text("Clicks")
                            .foregroundStyle(Color(hex:"#999CA0"))
                    }
                }
                .padding()
                
                HStack{
                    TextField("Enter link", text: $link)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(.leading)
                                    
                                    Button(action: {
                                        copyToClipboard(text: link)
                                    }) {
                                        Image(systemName: "doc.on.doc")
                                            .padding(.horizontal)
                                            .padding(.vertical, 10)
                                            .foregroundColor(.blue)
                                            .cornerRadius(8)
                                    }
                }
            }
        }
    }
}

#Preview {
    LinkDataBoxView()
}
