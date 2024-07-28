//
//  TodoManager.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import Foundation

actor TodoManager {
    var tasks: [Todo] = []
    
    func addTodo(_ todo: Todo) {
        tasks.append(todo)
    }
    
    func markDone(_ id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].toggle()
        }
    }
}
