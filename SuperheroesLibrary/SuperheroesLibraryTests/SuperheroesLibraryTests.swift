//
//  SuperheroesLibraryTests.swift
//  SuperheroesLibraryTests
//
//  Created by Valentina Muñoz on 19-12-24.
//

import XCTest
@testable import SuperheroesLibrary

final class SuperheroesLibraryTests: XCTestCase {
    
    func testEditHeroe() throws {
           // Configurar: crear un héroe de ejemplo
           let heroe = CustomHeroe(nombre: "Héroe Inicial", alias: "Heroito, El misterioso Sr. Héroe", poderes: "Poder Inicial")
           
           // Simular: editar el héroe
           let nuevoNombre = "Héroe Modificado"
           let nuevosAlias = "El héroe de acero"
           let nuevosPoderes = "Poder Modificado"
           heroe.nombre = nuevoNombre
           heroe.alias = nuevosAlias
           heroe.poderes = nuevosPoderes
           
           // Verificar: revisar que se actualizaron
           XCTAssertEqual(heroe.nombre, nuevoNombre, "El nombre del héroe no se actualizó.")
           XCTAssertEqual(heroe.alias, nuevosAlias, "El alias del héroe no se actualizó.")
           XCTAssertEqual(heroe.poderes, nuevosPoderes, "Los poderes del héroe no se actualizaron.")
       }

}
