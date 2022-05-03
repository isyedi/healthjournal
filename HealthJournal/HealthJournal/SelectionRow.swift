//
//  SelectionRow.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import Foundation
import SwiftUI

struct SelectionRow: View {
    
    let title: String
    @Binding var selectedItem: String?
    
    var body: some View {
        HStack{
            if title == selectedItem{
                Text(title).fontWeight(.heavy)
                    .foregroundColor(Color(red: 130.0/255, green: 176.0/255, blue: 241.0/255))
                    .font(.system(size: 25, weight: .bold, design: .rounded))
        
                
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

struct SelectionRowPreview: PreviewProvider {
    static var previews: some View {
        SelectionRow(title: "NoName", selectedItem: .constant("NoName"))
    }
}
