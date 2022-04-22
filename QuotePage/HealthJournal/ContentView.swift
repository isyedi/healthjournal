//
//  ContentView.swift
//  HealthJournal
//
//  Created by saerom on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        VStack(){
            HStack{
                Text("Your Quote \n of the day is:")
                    .font(.system(size:30))
            }
            .padding(.leading, -180)
            .padding(.bottom, 50)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray)
                .frame(width: 300, height: 400)
                .overlay(
                    Group{
                       Text("'Although the stars \n seem so close to each other \n they are millenniums  away'")
                            .lineSpacing(30)
                            .font(.system(size:20))
                            .padding(.leading, 0)
                            .padding(.bottom, 200)
                       Text("Saerom")
                            .padding(.leading, 100)
                            .padding(.bottom, -200)
                    }
                )
            
            
            TextField("How does this quote make you feel?", text: $username) // <1>, <2>
                .padding(.leading, 60)
                .padding(.top, 60)
            
            Button("Save") {
        
                        }
        }
        .padding(.bottom, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
