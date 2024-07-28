//
//  AddTodoView.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(TodoManagerWrapper.self) private var manager
    @Environment(\.dismiss) var dismiss
    @State private var newTodoContent = ""
    @State private var saveSuccessfull = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TextField("New Todo", text: $newTodoContent)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier(Accessibility.newTodoText)
                Button("Add Todo") {
                    let newTodo = Todo(id: UUID(), content: newTodoContent, checked: false)
                    Task {
                        await manager.addTodo(newTodo)
                    }
                    saveSuccessfull = true
                    newTodoContent = ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        dismiss.callAsFunction()
                    }
                }
                .accessibilityIdentifier(Accessibility.addTodoAction)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal)
            
            if saveSuccessfull {
                Text("Saving is successfull")
                    .bold()
                    .foregroundStyle(Color.green)
                    .animation(.easeInOut, value: saveSuccessfull)
                    .accessibilityIdentifier(Accessibility.successfulText)
            }
        }
        
    }
}

#Preview {
    AddTodoView()
        .environment(TodoManagerWrapper())
}
