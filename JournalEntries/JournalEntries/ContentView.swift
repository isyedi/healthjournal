
//
//  JournalMenu.swift
//  QuizPage
//
//  Created by saerom on 4/24/22.
//

import SwiftUI

struct JournalMenu: View {
    @State var currentMonth = ""
    var body: some View {
        VStack(spacing: 0){
            
            HStack(spacing: 0){
                Text("My Journal")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .padding(.bottom, 10)
            ScrollViewReader{proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(MonthTabs) { Month in
                            
                            Text(Month.title)
                                .foregroundColor(currentMonth == Month.id ? .black : .gray)
                                .font(.system(size: 20))
                                .onTapGesture{
                                    withAnimation(.easeInOut){
                                        currentMonth = Month.id
                                        proxy.scrollTo(currentMonth, anchor: .topTrailing)
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.top)
            .onAppear{
                currentMonth = MonthTabs.first?.id ?? ""
            }
            .padding([.horizontal, .top])
        
            ScrollViewReader{proxy in
                ScrollView(.vertical) {
                    ForEach(MonthTabs){Month in
                            CardView(tab: Month)
                    }
                }
            }
            .padding([.horizontal, .top])
        }
    
    }
}

struct CardView: View {
    var tab: MonthTab
    
    var body: some View {
        VStack {
            Text(tab.title + " Entries: ")
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(tab.Entries){ Entry in
                HStack {
                    VStack{
                        Text(Entry.title)
                            .font(.system(size: 25))
                        Text(Entry.text)
                    }
                }
            }
        }
    }
}

struct JournalMenu_Previews: PreviewProvider {
    static var previews: some View {
        JournalMenu()
    }
}


