//
//  CustomListRowView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.mint)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Aplicación",
            rowIcon: "apps.iphone",
            rowContent: "FungiLens",
            rowTintColor: .blue
        )
    }
}
