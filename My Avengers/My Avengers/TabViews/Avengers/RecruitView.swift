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
    
    var body: some View {
        NavigationView {
            
            if hero.recruits.count == 0 {
                AvengersEmptyStateView()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 200), spacing: 5),
                                        GridItem(.flexible(minimum: 100, maximum: 200))
                                       ], spacing: 10, content: {HeroDetailsView()})
                }.navigationTitle("My avengers")
            }
        }
    }
}

struct RecruitView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitView()
            .environmentObject(HeroListViewModel())
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
