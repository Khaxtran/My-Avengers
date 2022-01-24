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
    @State private var showAlert = false
    
    var body: some View {
        
        ForEach(hero.recruits, id: \.id) { heroID in
            NavigationLink(destination:
                            ScrollView {
                HeroImage(heroID: heroID)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        HeroBiographyView(heroID: heroID)
                        HeroAppearanceView(heroID: heroID)
                        HeroOccupationView(heroID: heroID)
                    }
                        .padding()
                }
                HeroStatsView(heroID: heroID)
                Button(action: {
                    self.showAlert = true
                }, label: {
                        Text("End contract")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color(.red))
                    
                })
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("End contract?"),
                              message: Text("Are you sure you want to end contract with \(heroID.name)?"),
                              primaryButton: .default(Text("Yes"),
                                                      action: {hero.remove(hero: heroID)}),
                              secondaryButton: .cancel(Text("No").foregroundColor(.red)))
                    })
            }
                            .navigationBarHidden(true)
            
                            
            ) {
                ZStack {
                    AsyncImage(url: heroID.image) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                                .opacity(0.9)
                        } else if phase.error != nil {
                            SwiftUI.Image("moon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 180)
                                .background(Color(.black).opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .shadow(color: Color.black.opacity(0.7), radius: 10, x: 10, y: 20)
                        } else {
                            LoadingImageView()
                                .frame(width: 150, height: 180)
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Text(heroID.name)
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
    @EnvironmentObject var hero: HeroListViewModel
    @State var heroID: HeroViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Text(heroID.name)
                .font(.system(size: 35, weight: .bold, design: .default))
                .padding(.leading, 10)
            Spacer()
            AsyncImage(url: heroID.image) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                        .shadow(color: Color.black.opacity(0.2), radius: 1.5, x: 2, y: 2)
                } else if phase.error != nil {
                    SwiftUI.Image("moon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55, alignment: .center)
                        .background(Color(.black).opacity(0.1))
                        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 10, y: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                } else {
                    LoadingImageView()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
}
