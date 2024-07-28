//
//  SwiftUI_UI_Test_CaseUITestsLaunchTests.swift
//  SwiftUI-UI-Test-CaseUITests
//
//  Created by Sucu, Ege on 27.07.2024.
//

import XCTest

final class SwiftUI_UI_Test_CaseUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
