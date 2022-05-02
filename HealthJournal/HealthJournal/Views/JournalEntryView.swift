//
//  JournalEntryView.swift
//  HealthJournal
//
//  Created by Irfan Syed on 5/1/22.
//

import SwiftUI

struct JournalEntryView: View {
    var journalViewModel: JournalViewModel
    
    var body: some View {
        NavigationView{
        VStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .overlay{
                        VStack{
                        Text(journalViewModel.journal.question)
                            .padding(.top, 25)
                            .font(.title)
                        Spacer().frame(height: 30)
                            GeometryReader { proxy in
                            ScrollView{
                                Text(journalViewModel.journal.answer).fixedSize(horizontal: false, vertical: false).frame(minWidth: proxy.size.width , minHeight: proxy.size.height - proxy.size.height / 5).multilineTextAlignment(.center)//.background(Color.green)
                    }
                    }
                }
                    
                }
                .frame(width: 350, height: 600)
        }
        .navigationBarHidden(true)
        
        }
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        var testData = Journal(question: "What is your name?", answer: "Nothing", quote: "Deez Nuts")
        JournalEntryView(journalViewModel: JournalViewModel(journal: testData))
    }
}
