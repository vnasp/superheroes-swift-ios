//
//  APIHeroeDetailView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI

struct APIHeroeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isShowingSheet: Bool = false

    @StateObject private var viewModel = APIHeroeViewModel()
    let heroId: Int
        
    var body: some View {
        ZStack {
            Color("ColorPurple").edgesIgnoringSafeArea(.all)
            
            Group {
                if viewModel.isLoadingHeroDetail {
                    ProgressView("Cargando detalles...")
                } else if let detail = viewModel.heroeDetail {
                    ScrollView {
                        VStack(spacing: 20) {
                            CustomTitle(text:detail.nombre)
                            
                            HStack(spacing: 20) {
                                AsyncImage(url: URL(string: detail.imagen)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.white, lineWidth: 4)
                                        )
                                        .shadow(color: .black, radius: 0, x: 6, y: 8)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    CustomCardDetail(title: "Nombre real", content: detail.nombreReal)
                                    
                                    CustomCardDetail(title: "Primera aparición", content: detail.primeraAparicion)
                                    
                                }
                            }
                            VStack(alignment: .leading, spacing: 20) {
                                CustomCardDetail(title: "Alias", content: detail.alias)
                                CustomCardDetail(title: "Poderes", content: detail.poderes)
                                CustomCardDetail(title: "Historia", content: detail.historia)
                            }
                        }.padding()
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchHeroDetail(id: heroId)
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
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    APIHeroeDetailView(heroId: 1)
}
