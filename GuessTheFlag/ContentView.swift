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
    
    @State private var countries = ["Estonia", "France", "Germany","Ireland","Italy","Nigeria","Poland","Russia", "Spain","UK","US"].shuffled()
    @State private var correctAnswers = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.black,.green], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack(spacing: 40){
                    VStack{
                        Text("Tap the flag off").font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswers]).font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ num in
                        Button{
                            flagTapped(num)
                        } label: {
                            Image(countries[num]).renderingMode(.original).clipShape(Capsule())
                                .shadow(radius: 7)
                        }
                    }
                    
                }.alert(scoreTitle,isPresented: $ShowingScore){
                    Button("Continue",action: askquestion)
                }message: {
                    Text("Your Answer is \(scoreTitle)")
                }
            
            }
        }
        func flagTapped(_ number:Int){
            if number == correctAnswers {
                scoreTitle = "Correct"
            } else { scoreTitle = "Wrong"}
            ShowingScore = true
        }
        func askquestion(){
            countries.shuffle()
            correctAnswers = Int.random(in: 0...2)
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
