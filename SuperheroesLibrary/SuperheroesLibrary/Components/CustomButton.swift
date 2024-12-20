//
//  CustomButton.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//

import SwiftUI

struct CustomButton<Destination: View>: View {
    var title: String
    var color: Color
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: 250)
                .background(color)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomButton(title: "Botón Prueba", color: .red, destination: APIHeroeView())
}
