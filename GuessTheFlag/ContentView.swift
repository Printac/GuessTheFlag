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
    @State private var correctAnswer = Int.random(in: 0...3)
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Circle().scale(1.9).foregroundColor(Color(white: 0.75))
            Circle().scale(1.61).foregroundColor(Color(white: 0.9))
                VStack(spacing: 40){
                    HStack{
                        AsyncImage(url: URL(string: "https://scontent.ftlv6-1.fna.fbcdn.net/v/t39.30808-6/307125844_433618172237394_9034353726235054305_n.png?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=sulI_KgQzQAAX8kYV3j&_nc_ht=scontent.ftlv6-1.fna&oh=00_AT_ZVkA8Ana3HvtlGHvsGX8TMEdMcYSO8yT_fAABIowzfA&oe=6349FBC6")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.clear
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        VStack{
                            
                            Text("נחש את הדגל !").font(.subheadline.weight(.heavy)).foregroundColor(.black)
                            Spacer().frame(height: 3)
                            Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold)).foregroundColor(.black)
                            
                        }
                    }
                    ForEach(0..<4){ num in
                        Button{
                            flagTapped(num)
                            
                        } label: {
                            Image(countries[num]).renderingMode(.original).clipShape(Capsule())
                                .shadow(radius: 7)
                        }
                    }
                    Text("נקודות: \(totalPoints)").foregroundColor(Color.black).bold()
                
                    
                }.alert(scoreTitle,isPresented: $ShowingScore){
                    Button("המשך",action: askquestion)
                }
            
            }
        }
        func flagTapped(_ number:Int){
            if number == correctAnswer {
                scoreTitle = "צוק גוזל!!!"
                self.totalPoints += 1
            } else {
                scoreTitle = "אוי :( חמורלו שואולו!!!"
                self.totalPoints = 0
            }
            ShowingScore = true
        }
        func askquestion(){
            countries.shuffle()
            correctAnswer = Int.random(in: 0...3)
            
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
