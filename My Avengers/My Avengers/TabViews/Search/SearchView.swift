//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI
import Kingfisher


struct SearchView: View {
    
    var body: some View {
        VStack {
            NavigationView {
                SearchResultsView()
            }
        }
        .ignoresSafeArea(.keyboard)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(HeroListViewModel())
    }
}
