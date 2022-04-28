//
//  JournalRepository.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/25/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


class JournalRepository: ObservableObject {
  private let path: String = "journals"
  private let store = Firestore.firestore()
    
  func add(_ journal: Journal) {
    do {
      _ = try store.collection(path).addDocument(from: journal)
    } catch {
      fatalError("Unable to add card: \(error.localizedDescription).")
    }
  }
    
    @Published var journals: [Journal] = []

    init() {
      get()
    }

    func get() {
      store.collection(path)
        .addSnapshotListener { querySnapshot, error in
          if let error = error {
            print("Error getting cards: \(error.localizedDescription)")
            return
          }

            self.journals = querySnapshot?.documents.compactMap { document in
            try? document.data(as: Journal.self)
          } ?? []
        }
    }
    
}
