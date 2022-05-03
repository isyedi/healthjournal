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
            ZStack{
                Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255).edgesIgnoringSafeArea(.all)
                VStack(spacing: 0){
                    
                    HStack(spacing: 0){
                        Text("My Journal")
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 10)

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
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255))
                            .padding(.bottom, 10)
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)

            }
            
        }
        
    }
}

struct JournalEntryButtonView: View {
    var journalViewModel: JournalViewModel
    var body: some View {
        NavigationLink(destination: JournalEntryView(journalViewModel: journalViewModel)){
        VStack{
            RoundedRectangle(cornerRadius: 25)
            .fill(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
            .frame(width: 350, height: 150)
            .overlay{
                Text("Prompt:")
                    .padding(.trailing, 225)
                    .padding(.bottom, 100)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                Text(journalViewModel.journal.question)
                    .fontWeight(.heavy)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 20)
            
    

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

