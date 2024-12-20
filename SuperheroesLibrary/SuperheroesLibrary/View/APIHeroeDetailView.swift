//
//  APIHeroeDetailView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI

struct APIHeroeDetailView: View {
    @StateObject private var viewModel = APIHeroeViewModel()
    let heroId: Int

    var body: some View {
        Group {
            if viewModel.isLoadingHeroDetail {
                ProgressView("Cargando detalles...")
            } else if let detail = viewModel.heroeDetail {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        AsyncImage(url: URL(string: detail.imagen)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                        .cornerRadius(10)

                        Text(detail.nombre)
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Nombre real: \(detail.nombreReal)")
                            .font(.title3)

                        Text("Primera aparición: \(detail.primeraAparicion)")
                            .font(.title3)

                        Text("Alias:")
                            .font(.headline)
                        ForEach(detail.alias, id: \.self) { alias in
                            Text("- \(alias)")
                        }

                        Text("Poderes:")
                            .font(.headline)
                        ForEach(detail.poderes, id: \.self) { poder in
                            Text("- \(poder)")
                        }

                        Text("Afiliaciones:")
                            .font(.headline)
                        ForEach(detail.afiliaciones, id: \.self) { afiliacion in
                            Text("- \(afiliacion)")
                        }

                        Text("Historia:")
                            .font(.headline)
                        Text(detail.historia)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
            }
        }.onAppear {
            Task {
                await viewModel.fetchHeroDetail(id: heroId)
            }
        }
        .navigationTitle("Detalle del Héroe")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    APIHeroeDetailView(heroId: 1)
}
