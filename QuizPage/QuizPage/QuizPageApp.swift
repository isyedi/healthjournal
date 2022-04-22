//
//  QuizPageApp.swift
//  QuizPage
//
//  Created by saerom on 4/21/22.
//

import SwiftUI

@main
struct QuizPageApp: App {
    var body: some Scene {
        WindowGroup {
            SelectionRow(title: "ABCD", selectedItem: .constant("NoName"))
        }
    }
}
