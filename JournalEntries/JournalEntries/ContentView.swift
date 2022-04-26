
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
        NavigationView {
        VStack(spacing: 0){
            
            HStack(spacing: 0){
                Text("My Journal")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .padding(.bottom, 10)
            ScrollViewReader{proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
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
                        .padding(.leading, 20)
                    }
                }
            }
            .padding(.top)
            .onAppear{
                currentMonth = MonthTabs.first?.id ?? ""
            }
        
                ScrollViewReader{proxy in
                    ScrollView(.vertical) {
                        ForEach(MonthTabs){Month in
                            if (currentMonth == Month.id){
                                CardView(tab: Month, currentmonth: Month.title)
                                
                            }
                            
                        }
                    }
                }
                .padding([.horizontal, .top])
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        }
    
    }
}

struct CardView: View {
    var tab: MonthTab
    
    var currentmonth : String
    
    var body: some View {
        VStack {
            Text(tab.title + " Entries: ")
                .underline()
                .font(.title.bold())
                .padding(.vertical)
                .lineLimit(1)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                

            
            ForEach(tab.Entries){ Entry in
                HStack {
                    VStack{
                        Text(Entry.title)
                            .underline()
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -10)
                            .padding(.leading, 15)
                        NavigationLink(destination: page3(_entry: Entry)){
                            Text(Entry.text)
                                .frame(width: 325, height: 40)
                                .border(Color.gray)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(Color.black)
                                .padding(.top, -10)
                            
                        }
                        .padding(.bottom, 15)

                        if (Entry.todays == true && currentmonth == "Todays"){
                            Text("Your Quote of the Day:")
                                .underline()
                                .font(.system(size: 30))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 30)
                                .padding(.leading, -10)
                            
                        }
                    }
                }
            }
        }
    }
}

struct page3 : View {
    var _entry: Entry
    var body : some View{
        Text("Title:" + _entry.title)
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray)
            .frame(width: 300, height: 400)
            .overlay(
                Group{
                    Text(_entry.text)
                        .lineSpacing(30)
                        .font(.system(size:20))
                        .padding(.leading, 0)
                        .padding(.bottom, 200)
                   Text("Saerom")
                        .padding(.leading, 100)
                        .padding(.bottom, -200)
                }
            )
        }
}


struct JournalMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JournalMenu()
            JournalMenu()
        }
    }
}


