//
//  APIHeroeView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//

import SwiftUI

struct APIHeroeView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isShowingSheet: Bool = false
    
    @StateObject private var viewModel = APIHeroeViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorPurple").edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        CustomTitle(text: "Biblioteca épica")
                        
                        Text("La info que necesitas de tu superhéroe favorito.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }.padding()
                    
                    LazyVStack(spacing: 20) {
                        ForEach(Array(viewModel.heroes.enumerated()), id: \.element.id) { index, heroe in
                            HStack(spacing: 10) {
                                AsyncImage(url: URL(string: heroe.imagen)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                        .overlay(
                                            Rectangle()
                                                .stroke(.white, lineWidth: 10)
                                                .cornerRadius(6)
                                        )
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(heroe.nombre)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text("Primera aparición: \(heroe.primeraAparicion)")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                NavigationLink(destination: APIHeroeDetailView(heroId: heroe.id)) {
                                    Image(systemName: "chevron.right.circle.fill")
                                        .font(.system(size: 34))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(Color("ColorGreen"))
                            .cornerRadius(8)
                            .shadow(color: .black, radius: 0, x: 6, y: 8)
                        }
                    }.padding(.horizontal, 20)
                }
                .onAppear {
                    Task {
                        await viewModel.fetchHeroes()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    APIHeroeView()
}
