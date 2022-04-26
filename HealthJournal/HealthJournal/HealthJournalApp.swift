//
//  HealthJournalApp.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/19/22.
//

import SwiftUI
import Firebase

@main
struct HealthJournalApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
