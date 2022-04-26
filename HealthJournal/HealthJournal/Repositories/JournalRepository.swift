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
    
}
