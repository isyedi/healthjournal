//
//  ContentView.swift
//  QuizPage
//
//  Created by saerom on 4/21/22.
//

import SwiftUI

struct SelectionRow: View {
    
    let title: String
    @Binding var selectedItem: String?
    
    var body: some View {
        HStack{
            if title == selectedItem{
                Text(title).fontWeight(.heavy)
                    .foregroundColor(Color(red: 161.0/255, green: 109.0/255, blue: 123.0/255))
                    .padding(.leading, 20)
                
            } else {
                Text(title)

                   
            }
        }
        .contentShape(Rectangle())
        .onTapGesture{
            self.selectedItem = self.title
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionRow(title: "NoName", selectedItem: .constant("NoName"))
    }
}
