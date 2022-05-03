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
            ZStack{
                Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255).ignoresSafeArea()
                VStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
                        .overlay{
                                VStack{
                                Text(journalViewModel.journal.question)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .frame(width: 300, height: 100)
                                        .scaledToFit()
                                        .minimumScaleFactor(0.01)
                                        .padding(.top, -10)
                                Spacer().frame(height: 30)
                                    GeometryReader { proxy in
                                    ScrollView{
                                        Text(journalViewModel.journal.answer).fixedSize(horizontal: false, vertical: false).frame(minWidth: proxy.size.width , minHeight: proxy.size.height - proxy.size.height / 5).multilineTextAlignment(.center)
                                            
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
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        var testData = Journal(question: "What is your name?", answer: "Nothing", quote: "Deez Nuts")
        JournalEntryView(journalViewModel: JournalViewModel(journal: testData))
    }
}
