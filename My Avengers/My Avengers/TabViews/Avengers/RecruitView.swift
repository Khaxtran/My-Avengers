//
//  CreateTeamView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import Kingfisher
import SwiftUI

struct RecruitView: View {
    @EnvironmentObject var hero: HeroListViewModel
    @State private var searchText = ""
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            if hero.recruits.count == 0 {
                AvengersEmptyStateView()
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 200), spacing: 5),
                                        GridItem(.flexible(minimum: 100, maximum: 200))],
                              spacing: 16,
                              content: {HeroDetailsView()})
                        .padding(.horizontal, 12)
                }
                .padding(.top, 150)
            }
        }
        .overlay(AvengersNavigationBar(heroCount: "\(hero.recruits.count)")
                    .frame(height: 108, alignment: .bottom)
                 // background must be placed after frame height
                    .background(Color(UIColor.systemBackground))
                    .frame(maxHeight: .infinity, alignment: .top))
        
    }
}

struct RecruitView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitView()
            .environmentObject(HeroListViewModel())
    }
}

struct AvengersNavigationBar: View {
    @State var heroCount: String
    @State var tapHeroCount = false
    
    var body: some View {
        
        HStack {
            Text("My avengers")
                .font(.largeTitle.weight(.bold))
            Spacer()
            Button(action: {
                tapHeroCount.toggle()
            }, label: {
                Text(tapHeroCount ? "\(heroCount) recuited" : "\(heroCount)")
                    .padding(10)
                
            })
                .frame(width: tapHeroCount ? 120 : 40, height: 40, alignment: .center)
                .background(tapHeroCount ? .blue : .green)
                .animation(.interpolatingSpring(mass: 1, stiffness: 150, damping: 25), value: tapHeroCount)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .animation(.interpolatingSpring(mass: 1, stiffness: 150, damping: 25), value: tapHeroCount)

        }
        .padding()
    }
}

struct AvengersEmptyStateView: View {
    var body: some View {
        
        VStack {
            Text("You don't have any avenger yet, search and recruit them now!")
                .font(.system(size: 20, weight: .regular))
                .padding(.top, 25)
                .padding(.horizontal, 15)
                .multilineTextAlignment(.center)
            
            GeometryReader { geo in
                SwiftUI.Image("male-professor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 1.5)
            }
        }
        .navigationTitle("My avengers")
    
    }
}
