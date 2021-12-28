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
                List {
                    Section {
                        ForEach(hero.recruits) { hero in
                            NavigationLink(destination: Text("Hero details")) {
                                HStack {
                                    Text(hero.name)
                                }
                            }
                        }
                    }
            }
                .navigationTitle("Avengers")
                .listStyle(InsetGroupedListStyle())
        }
    }
}

struct RecruitView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitView()
            .environmentObject(HeroListViewModel())
    }
}
