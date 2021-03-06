//
//  SingleSelectionListView.swift
//  QuizPage
//
//  Created by saerom on 4/21/22.
//

import SwiftUI
struct SingleSelectionListView: View {
    
    var items = ["I am Feeling Ok", "I am Feeling Sad" , "I am Feeling Happy", "I am not Ok"]

    @State var selectedItem: String? = nil

    var body: some View {
            NavigationView{
                ZStack{
                    Color(red: 245.0/255, green: 241.0/255, blue: 225.0/255)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        Text("How are You Feeling Today?").fontWeight(.heavy)
                            .padding(.top, 10)
                            .font(.system(size: 30))

                        List{
                            ForEach(items, id: \.self){ item in
                                SelectionRow(title:item, selectedItem: $selectedItem)
                            }
                            .listRowBackground(Color(red: 227.0/255, green: 219.0/255, blue: 186.0/255))
                        }
                        .onAppear() {
                             UITableView.appearance().backgroundColor = UIColor.clear
                             UITableViewCell.appearance().backgroundColor = UIColor.clear
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 190)
                        Spacer()
                        
                        Text("ONWARD!") .fontWeight(.heavy)
                            .padding(.bottom, 20)
                        Spacer()
                        if (selectedItem != nil){
                            NavigationLink(destination: page2(answerOne: selectedItem ?? "None")){
                                Text("NEXT").fontWeight(.heavy)
                                    .foregroundColor(Color.red)
                            }
                        }
                        
                    }
                    .navigationBarTitle("", displayMode: .inline)
                
                
                }
            }
    }
}

struct SingleSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelectionListView()
    }
}

struct page2 : View {
    
    var answerOne: String
    
    var items = ["Dog", "Cat" , "Horse", "Man"]

    @State var selectedItem: String? = nil
    
    var body : some View{
        NavigationView{
            ZStack{
                Color(red: 245.0/255, green: 241.0/255, blue: 225.0/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Question 1 Answer: " + answerOne)
                    Text("2?").fontWeight(.heavy)
                        .padding(.top, 10)
                        .font(.system(size: 30))

                    List{
                        ForEach(items, id: \.self){ item in
                            SelectionRow(title:item, selectedItem: $selectedItem)
                        }
                        .listRowBackground(Color(red: 227.0/255, green: 219.0/255, blue: 186.0/255))
                    }
                    .onAppear() {
                         UITableView.appearance().backgroundColor = UIColor.clear
                         UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 190)
                    Spacer()
                    
                    Text("ONWARD!") .fontWeight(.heavy)
                        .padding(.bottom, 20)
                    Spacer()
                    
                    if (selectedItem != nil){
                        NavigationLink(destination: page3(answerOne: answerOne, answerTwo: selectedItem ?? "None" )){
                            Text("NEXT").fontWeight(.heavy)
                                .foregroundColor(Color.red)
                        }
                
                    }
                }
                .navigationBarTitle("", displayMode: .inline)

            
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct page3 : View {
    
    var answerOne: String
    var answerTwo: String
    
    var body : some View{
        Text("Answer One: " + answerOne)
        Text("Answer Two: " + answerTwo)
        Text("Hello this is Page 3").fontWeight(.heavy)
            .padding(.bottom, 700)
        .navigationBarBackButtonHidden(true)
    }
}

