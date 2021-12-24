//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI
import Kingfisher


struct ContentView: View {
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
struct SearchResults: View {
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 200, maximum: 400), spacing: 12, alignment: .center)
        ],spacing: 12, content: {
            ForEach(viewModel.results, id: \.self) { hero in
                VStack(alignment: .center) {
                    KFImage(URL(string: hero.image.url))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(15)
                    Text(hero.name)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 200, height: 15, alignment: .top)
                        .padding(.vertical, 10)
                    VStack {
                        HStack {
                            Text("Gender:")
                                .font(.system(size: 15, weight: .semibold))
                            Text("\(hero.appearance.gender)")
                                .font(.system(size: 15))
                        }.frame(maxWidth: .infinity, maxHeight: 15, alignment: .topLeading)
                            .padding(.horizontal)
                    }
                    VStack {
                        HStack {
                            Text("Race:")
                                .font(.system(size: 15, weight: .semibold))
                            Text("\(hero.appearance.race)")
                                .font(.system(size: 15))
                        }.frame(maxWidth: .infinity, maxHeight: 15, alignment: .topLeading)
                            .padding(.horizontal)
                    }
                    VStack {
                        HStack {
                            Text("Universe:")
                                .font(.system(size: 15, weight: .semibold))
                            Text("\(hero.biography.publisher)")
                                .font(.system(size: 15))
                        }.frame(maxWidth: .infinity, maxHeight: 15, alignment: .topLeading)
                            .padding(.horizontal)
                    }
                }
                .frame(width: 250, height: 350, alignment: .center)
//                .background(Color.red)
            }
        
        }).padding(.vertical, 50)
    }
}

*/
