//
//  TodoView.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import SwiftUI

@MainActor
struct TodoView: View {
    
    @State private var tasks: [Todo] = []
    @State private var addTodo = false
    @Environment(TodoManagerWrapper.self) private var manager
    
    var filteredTasks: [Todo] {
        tasks.filter { !$0.checked }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if tasks.isEmpty {
                    ContentUnavailableView(
                        "No task is available. Add one",
                        systemImage: "checklist.unchecked"
                    )
                    .accessibilityIdentifier(Accessibility.emptyList)
                } else {
                    List(filteredTasks) { todo in
                        HStack {
                            Text(todo.content)
                            Spacer()
                            Button {
                                Task {
                                    await toggleTodo(todo.id)
                                    await updateTodos()
                                }
                            } label: {
                                Image(systemName: todo.checked ? "checkmark.square" : "square")
                            }
                        }
                        .accessibilityIdentifier(Accessibility.listItem(todo.content))
                    }
                }
            }
            .animation(.easeInOut, value: tasks)
            .onAppear {
                Task {
                    await updateTodos()
                }
            }
            .toolbar {
                Button {
                    addTodo.toggle()
                } label: {
                    Image(systemName: "plus.app.fill")
                }
                .accessibilityIdentifier(Accessibility.addTodo)
            }
            .sheet(isPresented: $addTodo, onDismiss: {
                Task {
                    await updateTodos()
                }
            }, content: {
                AddTodoView()
            })
            .navigationTitle(Text("Todo"))
        }
    }
    
    private func toggleTodo(_ id: UUID) async {
        await manager.markDone(id)
    }
    
    private func updateTodos() async {
        tasks = await manager.fetchTasks()
    }
}

#Preview("List with Data") {
    let manager = TodoManagerWrapper()
    let todo = Todo(id: .init(), content: "Hey", checked: false)
    Task {
        await manager.addTodo(todo)
    }
    return TodoView()
        .environment(manager)
}

#Preview("Empty Data") {
    TodoView()
        .environment(TodoManagerWrapper())
}
