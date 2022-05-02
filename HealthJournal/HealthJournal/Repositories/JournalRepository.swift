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
    
    var userId = ""
    private let authenticationService = AuthenticationService()
    private var cancellables: Set<AnyCancellable> = []
    
    
    func add(_ journal: Journal) {
        do {
          var newJournal = journal
          newJournal.userId = userId
          _ = try store.collection(path).addDocument(from: newJournal)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
      }
    
    @Published var journals: [Journal] = []

    init() {
        authenticationService.$user
          .compactMap { user in
            user?.uid
          }
          .assign(to: \.userId, on: self)
          .store(in: &cancellables)

        authenticationService.$user
          .receive(on: DispatchQueue.main)
          .sink { [weak self] _ in
            self?.get()
          }
          .store(in: &cancellables)
    }

    func get() {
      store.collection(path)
        .whereField("userId", isEqualTo: userId)
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
