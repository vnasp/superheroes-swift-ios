//
//  CustomHeroeView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI
import SwiftData

struct CustomHeroeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingSheet: Bool = false
    
    @Environment(\.modelContext) private var context
    @Query var heroes: [CustomHeroe]
    
    @State private var showingCreateView = false
    @State private var selectedHeroe: CustomHeroe?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorPurple").edgesIgnoringSafeArea(.all)
                
                VStack {
                    CustomTitle(text: "Tus Superhéroes").padding()
                    
                    if heroes.isEmpty {
                        Text("No hay superhéroes creados aún.")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(heroes) { heroe in
                                    HStack(spacing: 10) {
                                        Rectangle()
                                            .fill(.black)
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(6)
                                            .overlay(
                                                Rectangle()
                                                    .stroke(.white, lineWidth: 10)  .cornerRadius(6)
                                            )
                                            .overlay(
                                                Text(heroe.nombre.prefix(1))
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(heroe.nombre)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            Text("Alias: \(heroe.alias)")
                                                .font(.subheadline)
                                                .foregroundColor(.black)
                                            Text("Poderes: \(heroe.poderes)")
                                                .font(.subheadline)
                                                .foregroundColor(.black)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            Button {
                                                selectedHeroe = heroe
                                            } label: {
                                                Image(systemName: "square.and.pencil")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.heavy)
                                                    .foregroundColor(Color("ColorGreen"))
                                                    .padding()
                                                    .background(Circle().fill(Color.white))
                                            }
                                            
                                            Button {
                                                deleteHeroe(heroe)
                                            } label: {
                                                Image(systemName: "trash")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.heavy)
                                                    .foregroundColor(Color.red)
                                                    .padding()
                                                    .background(Circle().fill(Color.white))
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(Color("ColorGreen"))
                                    .cornerRadius(8)
                                    .shadow(color: .black, radius: 0, x: 6, y: 8)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    Spacer()
                    
                    CustomButton(
                        title: "Crear Superhéroe",
                        color: Color("ColorGreen"),
                        colorText: .white,
                        destination: CustomHeroeCreateView()
                    ).padding(.horizontal, 30)
                        .sheet(item: $selectedHeroe) { heroe in
                            CustomHeroeUpdateView(heroe: heroe)
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("ColorYellow"))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Image(systemName: "info.bubble.fill")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("ColorYellow"))
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        InfoAppView()
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
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
