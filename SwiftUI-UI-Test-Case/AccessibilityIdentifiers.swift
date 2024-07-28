//
//  AccessibilityIdentifiers.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 28.07.2024.
//

import Foundation

public struct Accessibility {
    public static let emptyList = "Empty List View"
    public static func listItem(_ content: String) -> String {
        "List Item \(content)"
    }
    public static let addTodo = "Add Todo"
    public static let newTodoText = "New Todo Textfield"
    public static let addTodoAction = "Add Todo Button"
    public static let successfulText = "Saved successfully"
    public static func finishedListItem(_ content: String) -> String {
        "Finished Todo \(content)"
    }
    public static let todoTab = "Todo Tab"
    public static let doneTab = "Done Tab"
}
