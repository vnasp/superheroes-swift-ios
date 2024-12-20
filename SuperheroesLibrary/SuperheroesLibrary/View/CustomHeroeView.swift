//
//  CustomHeroeView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI
import SwiftData

struct CustomHeroeView: View {
    @Environment(\.modelContext) private var context
    @Query var heroes: [CustomHeroe]

    @State private var showingCreateView = false
    @State private var selectedHeroe: CustomHeroe?

    var body: some View {
        NavigationView {
            VStack {
                if heroes.isEmpty {
                    Text("No hay héroes personalizados aún.")
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach(heroes) { heroe in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(heroe.nombre)
                                        .font(.headline)
                                    Text("Poderes: \(heroe.poderes)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Button("Editar") {
                                    selectedHeroe = heroe
                                }
                                .foregroundColor(.blue)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteHeroe(heroe)
                                } label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                        }
                    }
                }

                Spacer()

                Button(action: {
                    showingCreateView = true
                }) {
                    Text("Agregar Héroe")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showingCreateView) {
                    CustomHeroeCreateView()
                }
                .sheet(item: $selectedHeroe) { heroe in
                    CustomHeroeUpdateView(heroe: heroe)
                }
            }
            .navigationTitle("Héroes Personalizados")
        }
    }

    private func deleteHeroe(_ heroe: CustomHeroe) {
        context.delete(heroe)
        do {
            try context.save()
        } catch {
            print("Error al eliminar héroe: \(error)")
        }
    }
}

#Preview {
    CustomHeroeView()
}
