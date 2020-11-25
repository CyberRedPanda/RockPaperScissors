//
//  ContentView.swift
//  Rock_Paper_Scissors
//
//  Created by User23198271 on 6/5/20.
//  Copyright © 2020 Bryan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var u_score = 0
    @State private var c_score = 0
    @State private var options = ["rock", "paper", "scissors"].shuffled()
    @State private var options_tiny = ["rock_tiny", "paper_tiny", "scissors_tiny"]
    @State private var machine_choice = 0
    @State private var next = 0
    @State private var goal = true
    @State private var next_to_do = "Win this game!"
    
    var body: some View {
        ZStack {
            Color(red: 172 / 255, green: 200 / 255, blue: 230 / 255).edgesIgnoringSafeArea(.all)
        VStack(spacing: 30) {
            Text("")
            .padding(2)
            VStack {
                Text("Can you beat the computer?")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: 350, alignment: .leading)
            }
            HStack {
                Text("💁🏼‍♂️")
                    .font(.system(size: 56.0))
                Text("\(u_score)")
                    .fontWeight(.black)
                    .frame(width: 70, height: 70)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(.trailing, 40 )
                Text("🤖")
                    .font(.system(size: 56.0))
                Text("\(c_score)")
                    .fontWeight(.black)
                    .frame(width: 70, height: 70)
                    .background(Color.white)
                    .cornerRadius(25)
            }
            Image(self.options[self.next])
                .renderingMode(.original)
                .frame(width: 200, height: 220)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                .shadow(color: .black, radius: 2)
            
            HStack {
                ForEach(0 ..< 3) { number in
                Button(action: {
                    self.scoring(number: number)
                    self.next_to_do = self.goal_decide()
                    self.next = self.machine_select()
                }) {
                Image(self.options_tiny[number])
                    .renderingMode(.original)
                    .frame(width: 100, height: 120)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                    .shadow(color: .black, radius: 2)
                    .padding(15)
            }
        }
    }
            Text("\(next_to_do)")
            .font(.system(size: 50.0))
            Spacer()
            }
        }
    }
    
    func machine_select() -> Int {
        let choice = Int.random(in: 0 ... 2)
        return choice
    }
    func goal_decide() -> String {
        goal = Bool.random()
        if goal == true {
            return "Win this game!"
        } else {
            return "Lose this game!"
        }
    }
    func scoring(number: Int) {
        if goal == true {
            switch options[next] {
            case "rock":
                switch options_tiny[number] {
                case "scissors_tiny":
                    c_score += 1
                case "paper_tiny":
                    u_score += 1
                default:
                    u_score += 0
                }
            case "scissors":
                switch options_tiny[number] {
                case "rock_tiny":
                    u_score += 1
                case "paper_tiny":
                    c_score += 1
                default:
                    u_score += 0
                }
            case "paper":
                switch options_tiny[number] {
                case "scissors_tiny":
                    u_score += 1
                case "rock_tiny":
                    c_score += 1
                default:
                    u_score += 0
                }
            default:
                break
            }
        }
        else if goal == false {
            switch options[next] {
            case "rock":
                switch options_tiny[number] {
                case "scissors_tiny":
                    u_score += 1
                case "paper_tiny":
                    c_score += 1
                default:
                    u_score += 0
                }
            case "scissors":
                switch options_tiny[number] {
                case "rock_tiny":
                    c_score += 1
                case "paper_tiny":
                    u_score += 1
                default:
                    u_score += 0
                }
            case "paper":
                switch options_tiny[number] {
                case "scissors_tiny":
                    c_score += 1
                case "rock_tiny":
                    u_score += 1
                default:
                    u_score += 0
                }
            default:
                break
        }
    }
}
}
