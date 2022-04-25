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
                VStack{
                Text("Welcome to HealthJournal")
                    .font(.system(size: 45, weight: .bold, design: .serif))
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink(destination: JournalView().navigationBarBackButtonHidden(true)){
                    Text("Write an Entry")
                }
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
