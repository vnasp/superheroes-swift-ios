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
    @Query var heroes: [CustomHeroe]
    
    @State private var nombre = ""
    @State private var alias = ""
    @State private var poderes = ""
    @State private var errorMessage: String?
    
    var body: some View {
        ZStack {
            Color("ColorPurple").edgesIgnoringSafeArea(.all)
            VStack {
                CustomTitle(text: "Crear Superhéroe").padding()
                Text("Completa todos los campos para guardar a tu nuevo superhéroe.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
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
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("ColorPurple"))
                .cornerRadius(12)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color("ColorGreen"))
                        .frame(height: 50)
                        .cornerRadius(8)
                        .shadow(color: .black, radius: 0, x: 6, y: 8)
                    
                    Text("Guardar Superhéroe".uppercased())
                        .font(.custom("Impact", size: 20))
                        .foregroundColor(.white)
                }
                .scaleEffect(1.05)
                .animation(.easeInOut(duration: 0.2), value: true)
                .padding(.horizontal, 30)
                .onTapGesture {
                    guard isHeroUnique(nombre: nombre) else {
                        errorMessage = "Ya existe un superhéroe con este nombre."
                        return
                    }
                    
                    let newHeroe = CustomHeroe(nombre: nombre, alias: alias, poderes: poderes)
                    context.insert(newHeroe)
                    
                    do {
                        try context.save()
                        dismiss()
                    } catch {
                        errorMessage = "Error al guardar el héroe."
                    }
                }
                .disabled(nombre.isEmpty || alias.isEmpty || poderes.isEmpty)
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
    
    private func isHeroUnique(nombre: String) -> Bool {
        !heroes.contains { $0.nombre.caseInsensitiveCompare(nombre) == .orderedSame }
    }
}


#Preview {
    CustomHeroeCreateView()
}
