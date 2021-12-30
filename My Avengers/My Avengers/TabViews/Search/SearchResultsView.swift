//
//  SearchResultsView.swift
//  My Avengers
//
//  Created by Kha Tran on 30/12/21.
//

import SwiftUI
import Kingfisher

struct SearchResultsView: View {
    @EnvironmentObject var hero: HeroListViewModel
    @State public var searchText: String = ""
    
    var body: some View {
        List(hero.heros, id: \.id) { result in
            NavigationLink(result.name, destination: {
                VStack(alignment: .center) {
    
                        KFImage(result.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 323, height: 200, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 5)
                        
                    Text(result.name)
                        .font(.title)
                
                            RecruitButtonView(heroID: result)
    
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
            }
            
            )
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


struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}

struct RecruitButtonView: View {
    @EnvironmentObject var hero: HeroListViewModel
    @State var heroID: HeroViewModel
    @State var buttonMessage = ["Recruit", "Recruited"]
    @State var isRecruit : Bool = false
    @State var playAnimation: Bool = false
    
    var body: some View {
        Button(action: {
            self.isRecruit.toggle()
            if isRecruit == true && !hero.recruits.contains(heroID){
                hero.add(hero: heroID)
                self.playAnimation = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.playAnimation = false
                }
            } else {
                hero.remove(hero: heroID)
            }
            
        }) {
                Text(hero.recruits.contains(heroID) ? buttonMessage[1] : buttonMessage[0])
                    .font(.headline)
            
        }
        if playAnimation {
            RecruitedAnimation()
        }
        
    }
}
