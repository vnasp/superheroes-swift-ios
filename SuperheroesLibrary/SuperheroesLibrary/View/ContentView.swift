//
//  ContentView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var animateSpheres: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorPurple").edgesIgnoringSafeArea(.all)

                VStack {
                    ZStack {
                        Image("cover")
                            .resizable()
                            .edgesIgnoringSafeArea(.top)
                        
                        ForEach(0..<8, id: \.self) { index in
                            Rectangle()
                                .fill(Color.yellow.opacity(0.6))
                                .frame(width: 4, height: 12)
                                .offset(
                                    x: animateSpheres
                                    ? CGFloat.random(in: -350...350)
                                    : CGFloat.random(in: -10...100),
                                    y: animateSpheres ? -300 : 50
                                )
                                .rotationEffect(.degrees(Double.random(in: -30...30)))
                                .animation(
                                    Animation.easeInOut(duration: Double.random(in: 0.5...1.5))
                                        .repeatForever(autoreverses: false),
                                    value: animateSpheres
                                )
                        }
                        
                        CustomTitle(text:"Jarvis Hero Hub")
                            .frame(maxWidth: UIScreen.main.bounds.width / 1.5)
                            .offset(x: -60, y: 200)
                    }
                    
                    VStack {
                        Text("Navega por el listado de superhéroes o crea tu propia leyenda.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        CustomButton(
                            title: "Biblioteca Épica",
                            color: Color("ColorPink"),
                            colorText: .white,
                            destination: APIHeroeView()
                        ).padding(.horizontal, 30)
                        
                        CustomButton(
                            title: "Tus Superhéroes",
                            color: Color("ColorGreen"),
                            colorText: .white,
                            destination: CustomHeroeView()
                        ).padding(.horizontal, 30)
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 100_000_000)
                animateSpheres = true
            }
        }
    }
}


#Preview {
    ContentView()
}

