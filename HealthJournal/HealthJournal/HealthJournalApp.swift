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
        AuthenticationService.signIn()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
