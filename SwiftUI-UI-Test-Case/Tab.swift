//
//  Tab.swift
//  SwiftUI-UI-Test-Case
//
//  Created by Sucu, Ege on 27.07.2024.
//

import Foundation
import SwiftUI

enum Tab {
    case home
    case done
}

extension Tab: CaseIterable {}

extension Tab {
    var title: String {
        return switch self {
        case .home:
            "To-Do"
        case .done:
            "Done"
        }
    }
    
    var icon: String {
        return switch self {
        case .home:
            "checklist.unchecked"
        case .done:
            "checklist.checked"
        }
    }
}
