//
//  SwiftUI_UI_Test_CaseUITests.swift
//  SwiftUI-UI-Test-CaseUITests
//
//  Created by Sucu, Ege on 27.07.2024.
//

import XCTest
@testable import SwiftUI_UI_Test_Case

final class SwiftUI_UI_Test_CaseUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testEmptyList() throws {
        let emptyList = app.staticTexts[Accessibility.emptyList]
        XCTAssertTrue(emptyList.waitForExistence(timeout: 2))
    }
    
    func testAddTodo() throws {
        let addTodoButton = app.buttons[Accessibility.addTodo]
        let exists = addTodoButton.waitForExistence(timeout: 2)
        XCTAssertTrue(exists)
        addTodoButton.tap()

        let textField = app.textFields[Accessibility.newTodoText]
        textField.tap()
        textField.typeText("Demo")

        let addButton = app.buttons[Accessibility.addTodoAction]
        addButton.tap()

                let rowExists = app.staticTexts[Accessibility.listItem("Demo")].waitForExistence(timeout: 2)
        XCTAssertTrue(rowExists)
    }
    
    func testTabNavigation() throws {
        let todoListTab = app.tabBars.buttons.firstMatch
        let doneTab = app.tabBars.buttons.element(boundBy: 1)
        print(app.tabBars.buttons.debugDescription)
                
        doneTab.tap()
        XCTAssertTrue(doneTab.isSelected)
        
        todoListTab.tap()
        XCTAssertTrue(todoListTab.isSelected)
    }
    
    func testDoneTab() throws {
        try testAddTodo()
        let toggleButton = app.buttons[Accessibility.listItem("Demo")]
        toggleButton.tap()
        
        let doneTab = app.tabBars.buttons.element(boundBy: 1)
        doneTab.tap()
        let rowExists = app.staticTexts[Accessibility.finishedListItem("Demo")].waitForExistence(timeout: 2)
        XCTAssertTrue(rowExists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
