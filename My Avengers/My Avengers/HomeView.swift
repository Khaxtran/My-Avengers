//
//  HomeView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            MyAvengersView()
                .tabItem {
                    Label("Team", systemImage: "person.2.crop.square.stack")
                }
            RecruitView()
                .tabItem {
                    Label("Avengers", systemImage: "plus.app.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HeroListViewModel())
    }
}

