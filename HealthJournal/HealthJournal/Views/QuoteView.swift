
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
            ZStack{
                Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255).edgesIgnoringSafeArea(.all)
                VStack(){
    
                    Text("Your Quote Of The Day:")
                        .fontWeight(.heavy)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding(.top, 55)
                        .padding(.bottom, 20)
                    
                
            
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
                        .frame(width: 300, height: 400)
                        .overlay(
                            Group{
                               Text(quote)
                                    .lineSpacing(10)
                                    .font(.system(size: 200, design: .rounded))
                                    .padding(.leading, 0)
                                    .padding(.bottom, 200)
                                    .frame(width: 260, height: 360)
                                    .minimumScaleFactor(0.05)
                                    .allowsTightening(true)

                            }
                        )
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
                        .frame(width: 300, height: 40)
                        .overlay(
                            Group{
                                TextField("How does this quote make you feel?", text: $username) // <1>, <2>
                                    .padding(.leading, 15)
                                    .padding(.top, 0)

                            }
                        )
                    
                    
                    NavigationLink(destination: JournalListView().onAppear(){
                        addCard(question: journalQ, answer: journalA, quote: quote)
                    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        Text("Continue")
                            .fontWeight(.heavy)
                            .foregroundColor((Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255)))
                            .padding(.bottom, 20)
                    }
                    .padding(.top, 10)
                }
                .padding(.bottom, 100)
                .navigationBarBackButtonHidden(true)
                }
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
