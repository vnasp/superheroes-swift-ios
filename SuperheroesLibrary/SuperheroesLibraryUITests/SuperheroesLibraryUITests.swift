//
//  SuperheroesLibraryUITests.swift
//  SuperheroesLibraryUITests
//
//  Created by Valentina Muñoz on 19-12-24.
//

import XCTest

final class SuperheroesLibraryUITests: XCTestCase {

    @MainActor
    func testCreateCustomHero() throws {
        // 1. Abrir la app
        let app = XCUIApplication()
        app.launch()

        // 2. Navegar al botón de superhéroes personalizados.
        let tabBarButton = app.buttons["TUS SUPERHÉROES"]
        XCTAssertTrue(tabBarButton.exists, "No existe el botón de Tus Superhéroes.")
        tabBarButton.tap()

        // 3. Hacer click en el botón para crear el superhéroe
        let createButton = app.buttons["CREAR SUPERHÉROE"]
        XCTAssertTrue(createButton.exists, "No existe el botón de Crer Superhéroe.")
        createButton.tap()

        // 4. Crear el superhéroe
        let nameField = app.textFields["Nombre"]
        XCTAssertTrue(nameField.exists, "No funciona o no está el campo Nombre del Héroe.")
        nameField.tap()
        nameField.clearAndEnterText("SuperTester3")

        let aliasField = app.textFields["Alias"]
        XCTAssertTrue(aliasField.exists, "No funciona o no está el campo Alias.")
        aliasField.tap()
        aliasField.clearAndEnterText("El misterioso Sr. Tester")

        let powersField = app.textFields["Poderes"]
        XCTAssertTrue(powersField.exists, "No funciona o no está el campo Poderes.")
        powersField.tap()
        powersField.clearAndEnterText("Encontrar fallos, burlarse de los programadores")

        // 5. Guardar el nuevo superhéroe
        let saveButton = app.staticTexts["GUARDAR SUPERHÉROE"]
        XCTAssertTrue(saveButton.exists, "No funciona o no está el botón de Guardar Superhéroe.")
        saveButton.tap()

        // 6. Revisar que la lista lo muestre
        let newHero = app.staticTexts["SuperTester3"]
        XCTAssertTrue(newHero.exists, "El superhéroe creado no aparece en el listado.")
    }
}

extension XCUIElement {
    func clearAndEnterText(_ text: String) {
        guard let currentValue = self.value as? String else { return }
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}
