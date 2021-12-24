//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI
import Kingfisher


struct SearchView: View {
    
    @StateObject private var heroListVM = HeroListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(heroListVM.heros, id: \.heroId) { hero in
                HStack {
                    AsyncImage(url: hero.image, content: { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 150)
                            .cornerRadius(15)
                    }, placeholder: {
                        ProgressView()
                    })
                    
                    VStack {
                        Text(hero.name)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.horizontal)
                        HStack {
                            Text("Gender:")
                                .font(.system(size: 15, weight: .semibold))
                            Text(hero.gender)
                                .font(.system(size: 15))
                        }
                        HStack {
                            Text("Race:")
                                .font(.system(size: 15, weight: .semibold))
                            Text(hero.race)
                                .font(.system(size: 15))
                        }
                        HStack {
                            Text("Universe:")
                                .font(.system(size: 15, weight: .semibold))
                            Text(hero.universe)
                                .font(.system(size: 15))
                        }
                    }
                }
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task.init(){
                     if !value.isEmpty && value.count > 0 {
                        await heroListVM.search(name: value)
                    } else {
                        heroListVM.heros.removeAll()
                    }
                    }
            }.navigationTitle("Heros")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
