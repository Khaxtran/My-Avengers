//
//  ContentView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import SwiftUI

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
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
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
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
            GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
            GridItem(.flexible(minimum: 100, maximum: 200))
        ],spacing: 12, content: {
            ForEach(0..<35, id: \.self) { num in
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(width: 100, height: 100)
                        .background(Color.blue)
                        .cornerRadius(15)
                    Text("Hero name")
                        .font(.system(size: 20, weight: .semibold))
                    Text("Gender")
                        .font(.system(size: 15, weight: .regular))
                    Text("Race")
                        .font(.system(size: 15, weight: .regular))
                    Text("Universe")
                        .font(.system(size: 15, weight: .regular))
                }
                .padding()
                .background(Color.red)
            }
        
        }).padding(.horizontal, 20)
    }
}

