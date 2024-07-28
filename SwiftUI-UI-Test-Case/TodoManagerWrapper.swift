//
//  TodoManagerWrapper.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import Foundation
import Observation

@Observable
class TodoManagerWrapper {
    let todoManager = TodoManager()
    
    @MainActor
    func addTodo(_ todo: Todo) async {
        await todoManager.addTodo(todo)
    }
    
    @MainActor
    func markDone(_ id: UUID) async {
        await todoManager.markDone(id)
    }
    
    @MainActor
    func fetchTasks() async -> [Todo] {
        await todoManager.tasks
    }
}
