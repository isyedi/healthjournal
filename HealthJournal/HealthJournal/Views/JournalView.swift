//
//  JournalView.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/19/22.
//

import Foundation
import SwiftUI

struct JournalView: View {
    @State private var journalAnswer: String = "Write answer here..."
    @State private var journalQuestion: String = "What did you learn about yourself today?"
    
    init() {
            UITextView.appearance().backgroundColor = .clear 
    }
    var body: some View {
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
                .frame(width: 320, height: 320)
                .background(Color.green)
                Spacer()
            NavigationLink(destination: QuoteView().navigationBarBackButtonHidden(true)){
                Text("Save")
                // SEND OVER QUESTION AND ANSWER AND ADD JOURNAL IN QUOTE VIEW
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
      JournalView()
          .previewInterfaceOrientation(.portrait)
  }
}
