//
//  Journal.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/19/22.
//

import Foundation
import FirebaseFirestoreSwift
import Combine

struct Journal: Identifiable, Codable {
  @DocumentID var id: String?
    var question: String
    var answer: String
    var quote: String
    var userId: String?
}
