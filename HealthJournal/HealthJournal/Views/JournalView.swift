//
//  JournalView.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/19/22.
//

import Foundation
import SwiftUI


struct JournalView: View {
    
    var quizOneAns: String
    var quizTwoAns: String
    
    @State private var journalAnswer: String = "Write answer here..."
    
    init(quizOneAns: String, quizTwoAns: String) {
        UITextView.appearance().backgroundColor = .clear
        self.quizOneAns = quizOneAns
        self.quizTwoAns = quizTwoAns
    }
    
    var body: some View {
        
        let responses: [[String]] = [["If I was living my dream life right now, what would it look like?", "What distractions get in the way of you being the most productive?", "Think of a long-term goal you’re currently working towards. What is a step you can take today towards this goal?", "What upcoming opportunities or events are you grateful for? "], ["Think back to the last time you felt energized, what were you doing?", "List out 3 things you can do today that will get you closer to your goal: ", "What did you learn about yourself today?", "What life lessons are you grateful to have learnt?"], ["What can you do today to raise your energy by 1%?", "List everything you have accomplished today (no matter how small) and 1 thing you want to do next", "Let’s connect with your emotions. What is making you feel tired right now?", "Name five things that you’re grateful for today."], ["When did you feel most alive?", "What do you like to do to destress? Pick one and give yourself time to do this now.", "What has been draining my energy lately?", "Count off 10 blessings that you had today."]]
    
        let quizOneAnswers = ["Excited", "Content", "Tired", "Overwhelmed"]
    
        let quizTwoAnswers = ["Energetic", "Productive", "Mindful", "Grateful"]
        
        let journalQuestion = responses[quizOneAnswers.firstIndex(of: quizOneAns) ?? 0][quizTwoAnswers.firstIndex(of: quizTwoAns) ?? 0]

        
        NavigationView{
            ZStack{
            VStack{
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.cyan)
                    .frame(width: 350, height: 500)
                    //.padding(.top, 10)
            }
            VStack(spacing: 0){
            Text("Your Journaling Prompt")
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .bold, design: .default))
                .padding(.top, 20)
            Spacer()
            }
            VStack{
            Text(journalQuestion)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, design: .default))
                .frame(width: 300, height: 100)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                //.background(Color.red)
                .padding(.top, 60)
                Spacer().frame(height: 25)
            TextEditor(text: $journalAnswer)
                .font(.body)
                .foregroundColor(.white)
                .frame(width: 320, height: 330)
                //.background(Color.red)
                Spacer()
                NavigationLink(destination: QuoteView(journalA: journalAnswer, journalQ: journalQuestion, indexOne: (quizOneAnswers.firstIndex(of: quizOneAns) ?? 0), indexTwo: (quizTwoAnswers.firstIndex(of: quizTwoAns) ?? 0), journalListViewModel:   JournalListViewModel()).navigationBarBackButtonHidden(true)){
                Text("Save")
            }.padding(.bottom, 30)
            }.frame(width: 350, height: 670).padding(.top, 70)
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            Spacer()
        }
    }
}


struct JournalViewPreview: PreviewProvider {
  static var previews: some View {
      JournalView(quizOneAns: "Overwhelmed", quizTwoAns: "Energetic")
          .previewInterfaceOrientation(.portrait)
  }
}
