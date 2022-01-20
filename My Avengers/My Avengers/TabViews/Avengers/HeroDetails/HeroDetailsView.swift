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
                HeroImage(heroID: hero)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        HeroBiographyView(heroID: hero)
                        HeroAppearanceView(heroID: hero)
                        HeroOccupationView(heroID: hero)
                    }
                        .padding()
                }
                HeroImageView(heroID: hero)
            }
                            .navigationBarHidden(true)
            
                            
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

struct HeroImage: View {
    @State var heroID: HeroViewModel
    
    var body: some View {
        HStack {
            Text(heroID.name)
                .font(.system(size: 35, weight: .bold, design: .default))
                .padding(.leading, 10)
            Spacer()
            KFImage(heroID.image)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 1.5, x: 2, y: 2)
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
}
