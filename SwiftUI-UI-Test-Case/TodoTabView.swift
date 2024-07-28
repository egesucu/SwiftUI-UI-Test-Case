//
//  TodoTabView.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import SwiftUI

struct TodoTabView: View {
    
    @Environment(TodoManagerWrapper.self) private var manager
        
    var body: some View {
        TabView {
            TodoView()
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.icon)
                }
            DoneView()
                .tabItem {
                    Label(Tab.done.title, systemImage: Tab.done.icon)
                }
        }
    }
}

#Preview {
    TodoTabView()
        .environment(TodoManagerWrapper())
}
