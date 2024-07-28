//
//  DoneView.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import SwiftUI

struct DoneView: View {
    
    @State private var tasks: [Todo] = []
    @Environment(TodoManagerWrapper.self) private var manager
    
    var filteredTasks: [Todo] {
        tasks.filter(\.checked)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredTasks) { task in
                Text(task.content)
                    .accessibilityIdentifier(Accessibility.finishedListItem(task.content))
            }
            .onAppear {
                Task {
                    tasks = await manager.fetchTasks()
                }
            }
            .navigationTitle(Text("Done"))
        }
    }
}

#Preview {
    let manager = TodoManagerWrapper()
    let todo = Todo(id: .init(), content: "Hey", checked: true)
    Task {
        await manager.addTodo(todo)
    }
    return DoneView()
        .environment(manager)
}
