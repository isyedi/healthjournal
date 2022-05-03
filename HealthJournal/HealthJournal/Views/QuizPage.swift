//
//  SingleSelectionListView.swift
//  HealthJournal
//
//  Created by Irfan Syed on 4/24/22.
//

import Foundation
import SwiftUI
struct QuizPage1: View {
    
    var items = ["Excited", "Content" , "Tired", "Overwhelmed"]

    @State var selectedItem: String? = nil

    var body: some View {
            NavigationView{
                ZStack{
                    Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        Text("How are You Feeling Today?").fontWeight(.heavy)
                            .font(.system(size: 45, weight: .bold, design: .rounded))
                            .padding(.top, 75)


                        List{
                            ForEach(items, id: \.self){ item in
                                SelectionRow(title:item, selectedItem: $selectedItem)
                            }
                            .listRowBackground(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
                        }
                        .onAppear() {
                             UITableView.appearance().backgroundColor = UIColor.clear
                             UITableViewCell.appearance().backgroundColor = UIColor.clear
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 190)
                        Spacer()
                        
                        //Text("ONWARD!") .fontWeight(.heavy)
                            //.padding(.bottom, 20)
                        Spacer()
                        if (selectedItem != nil){
                            NavigationLink(destination: QuizPage2(answerOne: selectedItem ?? "None").navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Text("NEXT").fontWeight(.heavy)
                                    .foregroundColor(Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255))
                                    .padding(.bottom, 20)
                            }
                        }
                        
                    }
                    .navigationBarTitle("", displayMode: .inline)
                
                
                }
            }
    }
}

struct QuizPage1_Previews: PreviewProvider {
    static var previews: some View {
        QuizPage1()
    }
}

struct QuizPage2 : View {
    
    var answerOne: String
    
    var items = ["Energetic", "Productive" , "Mindful", "Grateful"]

    @State var selectedItem: String? = nil
    
    var body : some View{
        NavigationView{
            ZStack{
                Color(red: 253.0/255, green: 228.0/255, blue: 207.0/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("  How Do You\n Want To Feel?").fontWeight(.heavy)
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        .padding(.top, 75)

                    List{
                        ForEach(items, id: \.self){ item in
                            SelectionRow(title:item, selectedItem: $selectedItem)
                        }
                        .listRowBackground(Color(red: 251.0/255, green: 212.0/255, blue: 179.0/255))
                    }
                    .onAppear() {
                         UITableView.appearance().backgroundColor = UIColor.clear
                         UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 190)
                    Spacer()
                    
                    //Text("ONWARD!") .fontWeight(.heavy)
                        //.padding(.bottom, 20)
                    Spacer()
                    
                    if (selectedItem != nil){
//                        NavigationLink(destination: page3(answerOne: answerOne, answerTwo: selectedItem ?? "None" )){
//                            Text("NEXT").fontWeight(.heavy)
//                                .foregroundColor(Color.red)
//                        }
                        NavigationLink(destination: JournalView(quizOneAns: answerOne, quizTwoAns: selectedItem ?? "").navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                            Text("NEXT")
                                .fontWeight(.heavy)
                                .foregroundColor((Color(red: 107.0/255, green: 161.0/255, blue: 237.0/255)))
                                .padding(.bottom, 20)
                        }
                
                    }
                }
                .navigationBarTitle("", displayMode: .inline)

            
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct page3 : View {
//
//    var answerOne: String
//    var answerTwo: String
//
//    var body : some View{
//        Text("Answer One: " + answerOne)
//        Text("Answer Two: " + answerTwo)
//        Text("Hello this is Page 3").fontWeight(.heavy)
//            .padding(.bottom, 700)
//        .navigationBarBackButtonHidden(true)
//    }
//}
