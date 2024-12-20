//
//  SuperheroesLibraryApp.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//

import SwiftUI
import SwiftData

@main
struct SuperheroesLibraryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CustomHeroe.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
    }
}
