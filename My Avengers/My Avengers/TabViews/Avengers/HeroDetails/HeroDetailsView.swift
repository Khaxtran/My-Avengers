//
//  HeroDetailsView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import SwiftUI
import Kingfisher
import SmoothGradient

struct HeroDetailsView: View {
    @EnvironmentObject var hero: HeroListViewModel
    
    
    var body: some View {
        
        ForEach(hero.recruits, id: \.id) { hero in
            NavigationLink(destination:
                            ScrollView {
                HeroImageView(heroID: hero)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        HeroBiographyView(heroID: hero)
                        HeroAppearanceView(heroID: hero)
                        HeroOccupationView(heroID: hero)
                    }
                        .padding()
                }
            }
                            .navigationTitle(hero.name)
            
                            
            ) {
                ZStack {
                    KFImage(hero.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                        .opacity(0.9)
                    
                    
                    VStack {
                        Spacer()
                        Text(hero.name)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(7)
                            .background(Color.white.opacity(0.9))
                            .foregroundColor(Color.black.opacity(0.7))
                            .shadow(color: Color.white.opacity(0.6), radius: 10, x: 0, y: 10)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    }
                    .padding()
                    
                }
                .padding(.vertical, 5)
            }
        }
        
    }
}

struct HeroDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailsView()
            .environmentObject(HeroListViewModel())
    }
}

