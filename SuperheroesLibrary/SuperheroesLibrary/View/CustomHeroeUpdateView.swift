//
//  CustomHeroeUpdateView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI
import SwiftData

struct CustomHeroeUpdateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State var heroe: CustomHeroe
    @State private var nombre: String
    @State private var poderes: String

    init(heroe: CustomHeroe) {
        self.heroe = heroe
        _nombre = State(initialValue: heroe.nombre)
        _poderes = State(initialValue: heroe.poderes)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Héroe")) {
                    TextField("Nombre del Héroe", text: $nombre)
                    TextField("Poderes", text: $poderes)
                }
            }
            .navigationTitle("Editar Héroe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        heroe.nombre = nombre
                        heroe.poderes = poderes
                        do {
                            try context.save()
                            dismiss()
                        } catch {
                            print("Error al guardar cambios: \(error)")
                        }
                    }
                    .disabled(nombre.isEmpty || poderes.isEmpty)
                }
            }
        }
    }
}

#Preview {
    let hero = CustomHeroe(nombre: "Ejemplo Héroe", poderes: "Poderes de prueba")
    return CustomHeroeUpdateView(heroe: hero)
        .modelContainer(for: CustomHeroe.self, inMemory: true)
}
