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
                
                ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { num in
                    
                    HStack {
                        Text("\(num)")
                        Spacer()
                    }.padding()
                    
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.leading)
                }
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
