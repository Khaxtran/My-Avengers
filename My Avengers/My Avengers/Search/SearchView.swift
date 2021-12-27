//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI
import Kingfisher


struct SearchView: View {
    
    @StateObject public var heroListVM = HeroListViewModel()
    @State public var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(heroListVM.heros, id: \.heroId) { hero in
                NavigationLink(hero.name, destination: {
                    ScrollView {
                        
                        KFImage(hero.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 300)
                            .cornerRadius(5)
                        Text(hero.name)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.horizontal)
                    
                        HStack {
                            VStack {
                                SwiftUI.Image("power")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                Text(hero.power)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("intelligence")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(hero.intelligence)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("strength")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(hero.strength)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            VStack {
                                SwiftUI.Image("speed")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(hero.speed)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            VStack {
                                SwiftUI.Image("durability")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(hero.durability)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("combat")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(hero.combat)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                        }
                        VStack {
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
                })
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task.init(){
                     if !value.isEmpty && value.count > 1 {
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
