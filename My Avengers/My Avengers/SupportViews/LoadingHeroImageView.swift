//
//  LoadingHeroImageView.swift
//  My Avengers
//
//  Created by Kha Tran on 3/2/2022.
//

import SwiftUI

struct LoadingHeroImageView: View {
    @State var heroImage: URL?
    
    var body: some View {
        AsyncImage(url: heroImage) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else if phase.error != nil {
                SwiftUI.Image("moon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
            } else {
                SearchingAnimationView()
                    .frame(width: 50, height: 50, alignment: .center)
                    .shadow(color: Color(.black).opacity(0.1), radius: 0.5, x: 2, y: 2)
            }
        }
    }
}

struct LoadingHeroImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingHeroImageView()
    }
}
