//
//  CustomTitle.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 21-12-24.
//

import SwiftUI

struct CustomTitle: View {
    let text: String

    var body: some View {
        Text(text.uppercased())
            .font(.custom("Impact", size: 54))
            .foregroundColor(Color("ColorYellow"))
            .shadow(color: .black, radius: 0, x: 4, y: 8)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CustomTitle(text: "Título")
}
