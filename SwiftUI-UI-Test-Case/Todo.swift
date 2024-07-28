//
//  Todo.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID
    let content: String
    var checked: Bool
    
    mutating func toggle() {
        checked.toggle()
    }
    
}

extension Todo: Equatable {}
