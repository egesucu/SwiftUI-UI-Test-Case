//
//  SwiftUI_UI_Test_CaseApp.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import SwiftUI

@main
struct SwiftUI_UI_Test_CaseApp: App {
    
    @State private var manager = TodoManagerWrapper()
    
    var body: some Scene {
        WindowGroup {
            TodoTabView()
                .environment(manager)
        }
    }
}
