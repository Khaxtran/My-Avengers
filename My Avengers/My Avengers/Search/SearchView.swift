//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI
import Kingfisher


struct SearchView: View {
    @EnvironmentObject var hero: HeroListViewModel
    @State public var searchText: String = ""
    @State var isRecruit : Bool = false
    
    var body: some View {
        NavigationView {
            List(hero.heros, id: \.id) { result in
                NavigationLink(result.name, destination: {
                    ScrollView {
                        
                        KFImage(result.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 300)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        Text(result.name)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.horizontal)
                        
                        Button(action: {
                            self.isRecruit.toggle()
                            if (self.isRecruit == true) {
                                hero.add(hero: result)
                            } else {
                                hero.remove(hero: result)
                            }
                        }) {
                            Text(self.isRecruit == true ? "Recruited" : "Recruit")
                                .font(.headline)
                        }
                    
                        HStack {
                            VStack {
                                SwiftUI.Image("power")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: .center)
                                Text(result.power)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("intelligence")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(result.intelligence)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("strength")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(result.strength)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            VStack {
                                SwiftUI.Image("speed")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(result.speed)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                            VStack {
                                SwiftUI.Image("durability")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(result.durability)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            VStack {
                                SwiftUI.Image("combat")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text(result.combat)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                        }
                        VStack {
                            HStack {
                                Text("Gender:")
                                    .font(.system(size: 15, weight: .semibold))
                                Text(result.gender)
                                    .font(.system(size: 15))
                            }
                            HStack {
                                Text("Race:")
                                    .font(.system(size: 15, weight: .semibold))
                                Text(result.race)
                                    .font(.system(size: 15))
                            }
                            HStack {
                                Text("Universe:")
                                    .font(.system(size: 15, weight: .semibold))
                                Text(result.universe)
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
                        await hero.search(name: value)
                    } else {
                        hero.heros.removeAll()
                        }
                    }
            }.navigationTitle("Heros")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(HeroListViewModel())
    }
}
