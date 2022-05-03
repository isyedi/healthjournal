//
//  LandingPage.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/20/22.
//

import SwiftUI

struct LandingPage: View {
    
    @State var nextPage = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                (Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255))
                    .ignoresSafeArea()
                VStack{
                Text("Welcome \n to \n HealthJournal")
                        .foregroundColor(.black)
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.top, 225)
            
                    NavigationLink(destination: QuizPage1().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    Text("Write an Entry").fontWeight(.heavy)
                            .foregroundColor(Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255))
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        
                    }
                    .padding(.top, 60)
                    NavigationLink(destination: JournalListView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    Text("Skip to All Entries").fontWeight(.heavy)
                            .foregroundColor(Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255))
                        
                        
                }.padding(.bottom, 150)
                }
            
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
