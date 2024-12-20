//
//  ContentView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
            NavigationView {
                ZStack {
                    Color(.black).edgesIgnoringSafeArea(.all)
                    
                // Agregar una imagen de fondo y animaciones
                VStack(spacing: 20) {
                    CustomButton(
                        title: "Biblioteca Épica",
                        color: .red,
                        destination: APIHeroeView()
                    )
                    
                    CustomButton(
                        title: "Crea tu Leyenda",
                        color: .mint,
                        destination: CustomHeroeView()
                    )
                }
                .padding()
                .navigationTitle("Héroes")
            }
        }
    }
}

#Preview {
    ContentView()
}
