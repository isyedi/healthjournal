//
//  QuizPageApp.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import Foundation
import SwiftUI

struct QuizPageApp: App {
    var body: some Scene {
        WindowGroup {
            SelectionRow(title: "ABCD", selectedItem: .constant("NoName"))
        }
    }
}
