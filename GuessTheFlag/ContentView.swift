//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ben Printac on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var ShowingScore = false
    @State private var scoreTitle = ""
    @State private var totalPoints = 0
    
    @State private var countries = ["Estonia", "France", "Germany","Ireland","Italy","Nigeria","Poland","Russia", "Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...4)
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.green,.white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack(spacing: 40){
                    VStack{
                        Text("נחש את הדגל !").font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<5){ num in
                        Button{
                            flagTapped(num)
                            
                        } label: {
                            Image(countries[num]).renderingMode(.original).clipShape(Capsule())
                                .shadow(radius: 7)
                        }
                    }
                    Text("נקודות: \(totalPoints)").foregroundColor(Color.green).bold()
                
                    
                }.alert(scoreTitle,isPresented: $ShowingScore){
                    Button("המשך",action: askquestion)
                }
            
            }
        }
        func flagTapped(_ number:Int){
            if number == correctAnswer {
                scoreTitle = "כל הכבוד!"
                self.totalPoints += 1
            } else {
                scoreTitle = "אוי :("
                self.totalPoints = 0
            }
            ShowingScore = true
        }
        func askquestion(){
            countries.shuffle()
            correctAnswer = Int.random(in: 0...4)
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
