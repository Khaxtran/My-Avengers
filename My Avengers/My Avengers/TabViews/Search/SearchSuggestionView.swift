//
//  SearchSuggestionView.swift
//  My Avengers
//
//  Created by Kha Tran on 26/1/2022.
//

import SwiftUI

struct SearchSuggestionView: View {
    @State var text: String
    @State var suggestions = ["Superman", "Spiderman", "Batman", "Captain America", "Thor", "Shang-chi", "Flash", "Ironman"]
    
    var body: some View {
        VStack {
            ForEach(suggestions, id: \.self) { suggestion in
                Button(action: {
                    
                }, label: {
                    
                })
            }
        }
    }
}

struct SearchSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSuggestionView(text: "")
    }
}
