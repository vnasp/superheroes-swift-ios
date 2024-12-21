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
    @State private var alias: String
    @State private var poderes: String
    
    init(heroe: CustomHeroe) {
        self.heroe = heroe
        _nombre = State(initialValue: heroe.nombre)
        _alias = State(initialValue: heroe.alias)
        _poderes = State(initialValue: heroe.poderes)
    }
    
    var body: some View {
        ZStack {
            Color("ColorPurple").edgesIgnoringSafeArea(.all)
            VStack {
                CustomTitle(text: "Editar Superhéroe").padding()
                Text("Actualiza la información de tu superhéroe. Si dejas espacios en blanco, tu superhéroe no se podrá materializar.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 30)
                
                Form {
                    Section(header: Text("").foregroundColor(.white)) {
                        TextField("Nombre", text: $nombre)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Alias", text: $alias)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Poderes", text: $poderes)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .background(Color("ColorPurple"))
                .cornerRadius(12)
                
                ZStack {
                    Rectangle()
                        .fill(Color("ColorGreen"))
                        .frame(height: 50)
                        .cornerRadius(8)
                        .shadow(color: .black, radius: 0, x: 6, y: 8)
                    
                    Text("Actualizar".uppercased())
                        .font(.custom("Impact", size: 20))
                        .foregroundColor(.white)
                }                .padding(.horizontal, 40)
                
                    .scaleEffect(1.05)
                    .animation(.easeInOut(duration: 0.2), value: true)
                    .onTapGesture {
                        heroe.nombre = nombre
                        heroe.alias = alias
                        heroe.poderes = poderes
                        do {
                            try context.save()
                            dismiss()
                        } catch {
                            print("Error al actualizar: \(error)")
                        }
                    }
                    .disabled(nombre.isEmpty || alias.isEmpty || poderes.isEmpty)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
                .foregroundColor(Color("ColorYellow"))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let hero = CustomHeroe(nombre: "Ejemplo Héroe", alias: "Heroito, El misterioso Héroe", poderes: "Poderes de prueba")
    return CustomHeroeUpdateView(heroe: hero)
        .modelContainer(for: CustomHeroe.self, inMemory: true)
}
