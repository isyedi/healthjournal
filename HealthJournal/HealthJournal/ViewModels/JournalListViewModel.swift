//
//  JournalListViewModel.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/25/22.
//

import Foundation
import Combine

class JournalListViewModel: ObservableObject {
  @Published var journalRepository = JournalRepository()

  func add(_ journal: Journal) {
    journalRepository.add(journal)
  }
}
