//
//  JournalMenu.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import Foundation
import SwiftUI

struct JournalListView: View {
    @State var currentMonth = ""
    @ObservedObject var journalListViewModel = JournalListViewModel()
    var body: some View {
        NavigationView{
        VStack(spacing: 0){
            
            HStack(spacing: 0){
                Text("My Journal")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .padding(.bottom, 10)
//            ScrollViewReader{proxy in
//                ScrollView(.horizontal) {
//                    HStack(spacing: 20) {
//                        ForEach(MonthTabs) { Month in
//
//                            Text(Month.title)
//                                .foregroundColor(currentMonth == Month.id ? .black : .gray)
//                                .font(.system(size: 20))
//                                .onTapGesture{
//                                    withAnimation(.easeInOut){
//                                        currentMonth = Month.id
//                                        proxy.scrollTo(currentMonth, anchor: .topTrailing)
//                                    }
//                                }
//                        }
//                    }
//                }
//            }
//            .padding(.top)
//            .onAppear{
//                currentMonth = MonthTabs.first?.id ?? ""
//            }
//            .padding([.horizontal, .top])
        
            ScrollViewReader{proxy in
                ScrollView(.vertical) {
                    ForEach(journalListViewModel.journalViewModels){journalViewModel in
                        JournalEntryButtonView(journalViewModel: journalViewModel)
                    }
                }
            }
            .padding([.horizontal, .top])
            
            
            Spacer()
            NavigationLink(destination: QuizPage1().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                Text("Make Another Entry")
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
        
    }
}

//struct CardView: View {
//    var tab: MonthTab
//
//    var body: some View {
//        VStack {
//            Text(tab.title + " Entries: ")
//                .font(.title.bold())
//                .padding(.vertical)
//
//            ForEach(tab.Entries){ Entry in
//                HStack {
//                    VStack{
//                        Text(Entry.title)
//                            .font(.system(size: 25))
//                        Text(Entry.text)
//                    }
//                }
//            }
//        }
//    }
//}

struct JournalEntryButtonView: View {
    var journalViewModel: JournalViewModel
    var body: some View {
        NavigationLink(destination: JournalEntryView(journalViewModel: journalViewModel)){
        VStack{
            RoundedRectangle(cornerRadius: 25)
            .fill(Color.purple)
            .frame(width: 350, height: 150)
            .overlay{
                Text(journalViewModel.journal.question)
            }
            }
        }
        
    }
}


struct JournalMenu_Previews: PreviewProvider {
    static var previews: some View {
        JournalListView(journalListViewModel: JournalListViewModel())
    }
}

