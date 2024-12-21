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
    var colorText: Color
    var destination: Destination
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Rectangle()
                    .fill(color)
                    .frame(height: 50)
                    .cornerRadius(8)
                    .shadow(color: .black, radius: 0, x: 4, y: 8)

                
                Text(title.uppercased())
                    .font(.custom("Impact", size: 20))
                    .foregroundColor(colorText)
            }
            .scaleEffect(1.05)
            .animation(.easeInOut(duration: 0.2), value: true)
            .padding()
        }
    }
}

#Preview {
    ZStack {
        CustomButton(title: "Botón Prueba", color: .yellow, colorText:.black, destination: APIHeroeView())
    }.padding()
}
