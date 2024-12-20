//
//  APIHeroeView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//

import SwiftUI

struct APIHeroeView: View {
    @StateObject private var viewModel = APIHeroeViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoadingHeroes {
                    ProgressView("Cargando héroes...")
                } else {
                    List(viewModel.heroes) { heroe in
                        NavigationLink(destination: APIHeroeDetailView(heroId: heroe.id)) {
                            HStack {
                                AsyncImage(url: URL(string: heroe.imagen)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())

                                VStack(alignment: .leading) {
                                    Text(heroe.nombre)
                                        .font(.headline)
                                    Text("Primera aparición: \(heroe.primeraAparicion)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchHeroes()
                }
            }
            .navigationTitle("Biblioteca Épica")
        }
    }
}

#Preview {
    APIHeroeView()
}
