//
//  InfoAppView.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//

import SwiftUI

struct InfoAppView: View {
    var body: some View {
        List {
            Section (
                header: Text("Acerca de la App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright - Todos los derechos reservados")
                    Spacer()
                }
            ) {
                CustomListRowView(
                    rowLabel: "Tema",
                    rowIcon: "scribble.variable",
                    rowContent: "Superhéroes",
                    rowTintColor: .green)
                CustomListRowView(
                    rowLabel: "Aplicación",
                    rowIcon: "apps.iphone",
                    rowContent: "Jarvis Hero Hub",
                    rowTintColor: .blue)
                CustomListRowView(
                    rowLabel: "Compatibilidad",
                    rowIcon: "info.circle",
                    rowContent: "iOS",
                    rowTintColor: .red)
                CustomListRowView(
                    rowLabel: "Tecnología",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange)
                CustomListRowView(
                    rowLabel: "Versión",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .brown)
                CustomListRowView(
                    rowLabel: "Desarrollador",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "Valentina Muñoz",
                    rowTintColor: .indigo)
            }
        }
    }
}

#Preview {
    InfoAppView()
}
