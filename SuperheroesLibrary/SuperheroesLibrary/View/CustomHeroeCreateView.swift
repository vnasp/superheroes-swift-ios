//
//  CustomHeroeCreateView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI
import SwiftData

struct CustomHeroeCreateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query var heroes: [CustomHeroe] // Consulta la lista actual de héroes

    @State private var nombre = ""
    @State private var poderes = ""
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Héroe")) {
                    TextField("Nombre del Héroe", text: $nombre)
                    TextField("Poderes", text: $poderes)
                }

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .navigationTitle("Agregar Héroe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        if isHeroUnique(nombre: nombre) {
                            let newHeroe = CustomHeroe(nombre: nombre, poderes: poderes)
                            context.insert(newHeroe)
                            do {
                                try context.save()
                                dismiss()
                            } catch {
                                errorMessage = "Error al guardar el héroe."
                            }
                        } else {
                            errorMessage = "Ya existe un héroe con este nombre."
                        }
                    }
                    .disabled(nombre.isEmpty || poderes.isEmpty)
                }
            }
        }
    }

    private func isHeroUnique(nombre: String) -> Bool {
        !heroes.contains { $0.nombre.caseInsensitiveCompare(nombre) == .orderedSame }
    }
}


#Preview {
    CustomHeroeCreateView()
}
