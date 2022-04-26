//
//  MainPage.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        TabView{
            
            Text("View 1")
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("My Journal")
                }
            
            
            
            
            Text("View 2")
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }

        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
