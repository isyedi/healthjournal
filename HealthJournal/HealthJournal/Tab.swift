//
//  Tab.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import Foundation
import SwiftUI

struct Entry : Identifiable {
    var id = UUID().uuidString
    var title : String
    var text : String
    var month: String
}

var Entries = [
    Entry(title: "Test1", text:"hey", month: "January"),
    Entry(title: "Test2", text:"hey2", month: "January"),
    Entry(title: "Test3", text:"hey3", month: "March"),
    Entry(title: "Test4", text:"hey4", month: "March"),
    Entry(title: "Test5", text:"hey5", month: "May"),
    Entry(title: "Test6", text:"hey6", month: "January"),
    Entry(title: "Test7", text:"hey7", month: "January"),
    Entry(title: "Test8", text:"hey8", month: "January"),
    Entry(title: "Test9", text:"hey9", month: "January")
    
]
struct MonthTab : Identifiable {
    var id = UUID().uuidString
    var title: String
    var Entries: [Entry]
}

var MonthTabs = [
    MonthTab(title: "January", Entries: Entries.filter(){$0.month == "January"}),
    MonthTab(title: "February", Entries: Entries.filter(){$0.month == "February"}),
    MonthTab(title: "March", Entries: Entries.filter(){$0.month == "March"}),
    MonthTab(title: "April", Entries: Entries.filter(){$0.month == "April"}),
    MonthTab(title: "May", Entries: Entries.filter(){$0.month == "May"}),
    MonthTab(title: "June", Entries: Entries.filter(){$0.month == "June"}),
    MonthTab(title: "July", Entries: Entries.filter(){$0.month == "July"}),
    MonthTab(title: "August", Entries: Entries.filter(){$0.month == "August"}),
    MonthTab(title: "September", Entries: Entries.filter(){$0.month == "September"}),
    MonthTab(title: "October", Entries: Entries.filter(){$0.month == "October"}),
    MonthTab(title: "Novemeber", Entries: Entries.filter(){$0.month == "Novemeber"}),
    MonthTab(title: "Decemeber", Entries: Entries.filter(){$0.month == "Decemeber"}),
]
