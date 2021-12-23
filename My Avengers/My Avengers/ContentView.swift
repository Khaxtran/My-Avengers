//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI

class GridViewModel: ObservableObject {
    @Published var items = 0..<10
    @Published var results = [Hero]()
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.items = 0..<15
        }
        
        fetchHero()
    }
    
    
    func fetchHero() {
        let baseUrl = URL(string: "https://www.superheroapi.com/api.php/4632428266824459/620")!
        
        URLSession.shared.request(
            url: baseUrl,
            expecting: Hero.self,
            completion: { result in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    print(results)
                    self.results = [results]
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}

struct ContentView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    @State private var animationAmount = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                SearchResults()
                
            }
            .navigationTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @State var opacity = 1.0
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search for heros", text: $searchText).padding(.leading, 50)
                
            }
            .padding(.vertical, 10)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    SwiftUI.Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            SwiftUI.Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    
                }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
                .animation(.spring(), value: opacity)
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                    to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.leading, -10)
                        .padding(.trailing)
                }).transition(.move(edge: .trailing))
                    .animation(.spring(), value: opacity)
            }
            
        }
    }
}

struct SearchResults: View {
    
    @ObservedObject var viewModel = GridViewModel()
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 200, maximum: 400), spacing: 12, alignment: .center)
        ],spacing: 12, content: {
            ForEach(viewModel.results, id: \.self) { hero in
                VStack(alignment: .center) {
                    Spacer()
                        .frame(width: 200, height: 200)
                        .background(Color.blue)
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
                        }.frame(width: 180, height: 15, alignment: .topLeading)
                    }
                    VStack {
                        HStack {
                            Text("Race:")
                                .font(.system(size: 15, weight: .semibold))
                            Text("\(hero.appearance.race)")
                                .font(.system(size: 15))
                        }.frame(width: 180, height: 15, alignment: .topLeading)
                    }
                    VStack {
                        HStack {
                            Text("Universe:")
                                .font(.system(size: 15, weight: .semibold))
                            Text("\(hero.biography.publisher)")
                                .font(.system(size: 15))
                        }.frame(width: 180, height: 15, alignment: .topLeading)
                    }
                }
                .frame(width: 250, height: 350, alignment: .center)
//                .background(Color.red)
            }
        
        }).padding(.vertical, 50)
    }
}

