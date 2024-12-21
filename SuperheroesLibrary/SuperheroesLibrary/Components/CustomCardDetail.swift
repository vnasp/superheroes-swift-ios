//
//  CustomCardDetail.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI

struct CustomCardDetail: View {
    let title: String
    let content: Any
    
    var formattedContent: String {
            if let contentString = content as? String {
                return contentString
            } else if let contentArray = content as? [String] {
                return contentArray.joined(separator: ", ")
            } else {
                return ""
            }
        }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(formattedContent)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color("ColorGreen"))
        .cornerRadius(8)
        .shadow(color: .black, radius: 0, x: 6, y: 8)
    }
}

#Preview {
    CustomCardDetail(title: "Nombre real", content: "Peter Parker")
}
