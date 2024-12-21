//
//  SuperheroesLibraryTests.swift
//  SuperheroesLibraryTests
//
//  Created by Valentina Muñoz on 19-12-24.
//

import XCTest
@testable import SuperheroesLibrary

final class SuperheroesLibraryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEditHeroe() throws {
           // Configuración: Crear un héroe de ejemplo
           let heroe = CustomHeroe(nombre: "Héroe Inicial", alias: "Heroito, El misterior Sr. Héroe", poderes: "Poder Inicial")
           
           // Simular edición del héroe
           let nuevoNombre = "Héroe Modificado"
           let nuevosAlias = "El héroe de acero"
           let nuevosPoderes = "Poder Modificado"
           heroe.nombre = nuevoNombre
           heroe.alias = nuevosAlias
           heroe.poderes = nuevosPoderes
           
           // Verificación: Comprobar que los datos del héroe se actualizaron
           XCTAssertEqual(heroe.nombre, nuevoNombre, "El nombre del héroe no se actualizó correctamente.")
           XCTAssertEqual(heroe.alias, nuevosAlias, "El alias del héroe no se actualizó correctamente.")
           XCTAssertEqual(heroe.poderes, nuevosPoderes, "Los poderes del héroe no se actualizaron correctamente.")
       }

}
