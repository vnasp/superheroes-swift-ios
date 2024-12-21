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
                LinearGradient(
                    gradient: Gradient(colors: [.black, Color("ColorPurple")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        Image("cover")
                            .resizable()
                            .edgesIgnoringSafeArea(.top)
                        
                        ForEach(0..<10, id: \.self) { index in
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
                        
                        Text("Jarvis Hero Hub".uppercased())
                            .font(.custom("Impact", size: 54))
                            .foregroundColor(Color("ColorYellow"))
                            .shadow(color: .black, radius: 0, x: 4, y: 8)
                            .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .offset(x: -30, y: 200)
                    }
                    
                    VStack {
                        Text("Navega por el listado de superhéroes o crea tu propia leyenda.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        CustomButton(
                            title: "Biblioteca Épica",
                            color: Color("ColorOrange"),
                            colorText: .white,
                            destination: APIHeroeView()
                        ).padding(.horizontal, 30)
                        
                        CustomButton(
                            title: "Crea tu Superhéroe",
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

