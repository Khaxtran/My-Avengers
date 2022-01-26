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
    private var suggestions = ["Superman", "Spiderman", "Batman", "Captain America", "Thor", "Shang-chi", "Flash", "Ironman"]
    
    var body: some View {
        
        SearchingView()
            .listStyle(.insetGrouped)
            .searchable(text: $searchText) {
                ForEach(suggestions, id: \.self) { suggestion in
                    Button(action: {
                        searchText = suggestion
                    }, label: {
                        Text(suggestion)
                    })
                }
            }
            .onChange(of: searchText) { value in
                Task.init(){
                    if !value.isEmpty && value.count > 1 {
                        await hero.search(name: value)
                    } else {
                        hero.heros.removeAll()
                    }
                }
            }
            .navigationTitle("Heros")
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
    
    var body: some View {
        Button(action: {
            self.isRecruit.toggle()
            if isRecruit == true && !hero.recruits.contains(heroID){
                hero.add(hero: heroID)
            } else {
                hero.remove(hero: heroID)
            }
            
        }) {
                Text(hero.recruits.contains(heroID) ? buttonMessage[1] : buttonMessage[0])
                    .font(.headline)
            
        }
        
    }
}

struct SearchingView: View {
    @EnvironmentObject var hero: HeroListViewModel
    @Environment(\.isSearching) var isSearching

      var body: some View {
        if isSearching {
            List(hero.heros, id: \.id) { result in
                NavigationLink(result.name, destination: {
                    VStack(alignment: .center) {
                        AsyncImage(url: result.image) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 250, height: 250, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 5)
                            } else if phase.error != nil {
                                SwiftUI.Image("moon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250)
                                    .background(Color(.black).opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.7), radius: 10, x: 10, y: 20)
                            } else {
                                LoadingImageView()
                                    .frame(width: 250, height: 250)
                                    .background(Color(.black).opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 20)
                            }
                        }
                                
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
                    
                })
                    .frame(alignment: .top)
            }
        } else {
            LoadingView()
        }
      }
}
