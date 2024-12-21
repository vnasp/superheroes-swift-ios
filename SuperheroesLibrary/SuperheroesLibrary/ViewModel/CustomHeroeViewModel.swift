//
//  CustomHeroeViewModel.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//
//  @Published: SwiftUI observa esta propiedad y actualiza la interfaz cada vez que cambie su valor.
//  ModelContext: contexto de SwiftData para manejar la persistencia


import Foundation
import SwiftData

@MainActor
class CustomHeroeViewModel: ObservableObject {
    @Published var heroes: [CustomHeroe] = []

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
        fetchHeroes()
    }

    func fetchHeroes() {
        do {
            heroes = try context.fetch(FetchDescriptor<CustomHeroe>())
        } catch {
            print("Error al obtener los superhéroes: \(error)")
        }
    }

    func addHero(nombre: String, alias: String, poderes: String) {
        let newHero = CustomHeroe(nombre: nombre, alias: alias, poderes: poderes)
        context.insert(newHero)
        saveContext()
        fetchHeroes()
    }

    func editHero(heroe: CustomHeroe, nuevoNombre: String, nuevosAlias: String, nuevosPoderes: String) {
        heroe.nombre = nuevoNombre
        heroe.alias = nuevosAlias
        heroe.poderes = nuevosPoderes
        saveContext()
        fetchHeroes()
    }

    func deleteHero(heroe: CustomHeroe) {
        context.delete(heroe)
        saveContext()
        fetchHeroes()
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error al guardar cambios: \(error)")
        }
    }
}
