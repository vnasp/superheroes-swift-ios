//
//  SuperheroesLibraryUITests.swift
//  SuperheroesLibraryUITests
//
//  Created by Valentina Muñoz on 19-12-24.
//

import XCTest

final class SuperheroesLibraryUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    @MainActor
    func testEditCustomHero() throws {
        // 1. Inicializar la app
        let app = XCUIApplication()
        app.launch()

        // 2. Navegar a la vista de héroes personalizados
        let tabBarButton = app.buttons["Crea tu Leyenda"] // Asegúrate que coincida con el nombre del botón o tab
        XCTAssertTrue(tabBarButton.exists, "El botón de 'Crea tu Leyenda' no existe")
        tabBarButton.tap()

        // 3. Verificar que existe al menos un héroe en la lista
        let firstHero = app.staticTexts["Héroe Inicial"] // Cambia por el nombre esperado del héroe
        XCTAssertTrue(firstHero.exists, "No hay héroes disponibles para editar")

        // 4. Tap en el botón de editar para el primer héroe
        let editButton = app.buttons["Editar"]
        XCTAssertTrue(editButton.exists, "El botón 'Editar' no existe para el héroe seleccionado")
        editButton.tap()

        // 5. Editar los campos de nombre y poderes
        let nameField = app.textFields["Nombre del Héroe"]
        XCTAssertTrue(nameField.exists, "El campo de nombre no está disponible")
        nameField.tap()
        nameField.clearAndEnterText("Héroe Modificado")

        let powersField = app.textFields["Poderes"]
        XCTAssertTrue(powersField.exists, "El campo de poderes no está disponible")
        powersField.tap()
        powersField.clearAndEnterText("Poder Modificado")

        // 6. Guardar los cambios
        let saveButton = app.buttons["Guardar"]
        XCTAssertTrue(saveButton.exists, "El botón 'Guardar' no está disponible")
        saveButton.tap()

        // 7. Verificar que los cambios se reflejan en la lista
        let updatedHero = app.staticTexts["Héroe Modificado"]
        XCTAssertTrue(updatedHero.exists, "El héroe no se actualizó correctamente en la lista")
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
