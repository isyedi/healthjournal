//
//  JournalViewModel.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/27/22.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject, Identifiable {
    
    private let journalRepository = JournalRepository()
    private var cancellables: Set<AnyCancellable> = []
    @Published var journal: Journal
    var id = ""

  init(journal: Journal) {
    self.journal = journal
    $journal
      .compactMap { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
  }
    
    
}
