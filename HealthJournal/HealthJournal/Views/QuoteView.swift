
//
//  QuoteView.swift
//  HealthJournal
//
//  Created by saerom on 4/19/22.
//
import Foundation
import SwiftUI

struct QuoteView: View {
    
    @State private var username: String = ""
    var journalA: String
    var journalQ: String
    var indexOne: Int
    var indexTwo: Int
    @ObservedObject var journalListViewModel: JournalListViewModel

    var body: some View{
        
        let quotes: [[String]] = [["You're the average of the five people you spend the most time with. \n \t \t \t \t \t -Jim Rohn","We are what we repeatedly do. Excellence is not an act, but a habit. \n \t \t \t \t \t~ Aristotle","The best way to capture moments is to pay attention. This is how we cultivate mindfulness. \n \t \t \t \t -Jon Kabat-Zinn","Live a life full of humility, gratitude, intellectual curiosity, and never stop learning. \n \t \t \t \t -GZA"], ["Be a positive energy trampoline – absorb what you need and rebound more back. - Dave Carolan. \n \t \t \t \t","You need to practice the person you want to be. ","Mindfulness is a way of befriending ourselves and our experience \n \t \t \t \t -Jon Kabat-Zinn","We learned about gratitude and humility - that so many people had a hand in our success. \n \t \t \t \t -Michelle Obama"], ["Focus on an ocean of positives, not a puddle of negatives. \n \t \t \t \t- Kevin Ansbro","You have to assemble yourself, action by action. \n \t \t  ~ Marcus Aurelius","Meditation is not evasion; it is a serene encounter with reality. \n \t \t \t -Thích Nhất Hạn","Gratitude turns what we have into enough."], ["You’re allowed to scream. You’re allowed to cry. But, do not give up.","Every morning you have two choices: continue to sleep with your dreams or wake up and chase them.","Anger is just a proof of how unrealistic your expectations were. \n \t \t \t ~ Stoic Wisdom","Pain will leave once it's done teaching you. \n \t \t \t ~ Bruce Lee "]]
        
        let quote: String = quotes[indexOne][indexTwo]
        
        NavigationView{
        VStack(){
            HStack{
                Text("Your Quote Of The Day Is:")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            //.padding(.leading, -180)
            .padding(.bottom, 50)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.purple)
                .frame(width: 300, height: 400)
                .overlay(
                    Group{
                       Text(quote)
                            .lineSpacing(20)
                            .font(.system(size: 200))
                            .padding(.leading, 0)
                            .padding(.bottom, 200)
                            .frame(width: 260, height: 360)
                            .minimumScaleFactor(0.05)
                            .allowsTightening(true)
                            //.background(Color.red)
//                       Text("Saerom")
//                            .padding(.leading, 100)
//                            .padding(.bottom, -200)
                    }
                )
            
            
            TextField("How does this quote make you feel?", text: $username) // <1>, <2>
                .padding(.leading, 60)
                .padding(.top, 60)
            
            NavigationLink(destination: JournalListView().onAppear(){
                addCard(question: journalQ, answer: journalA, quote: quote)
            }.navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                Text("Continue")
            }
        }
        .padding(.bottom, 100)
        .navigationBarBackButtonHidden(true)
        }
        

    }
    
private func addCard(question: String, answer: String, quote: String ) {
    let journal = Journal(question: question, answer: answer, quote: quote)
    journalListViewModel.add(journal)
    //presentationMode.wrappedValue.dismiss()
}
    
    
}




struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let journalTest = Journal(question: "HI", answer: "HI", quote: "HI")
            QuoteView(journalA: journalTest.answer, journalQ: "How are you?", indexOne: 1, indexTwo: 3, journalListViewModel: JournalListViewModel())
        }
    }
}
