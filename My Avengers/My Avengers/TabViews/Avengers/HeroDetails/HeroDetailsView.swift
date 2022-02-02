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
    @State private var showDetails = false
    
    var body: some View {
        ForEach(hero.recruits, id: \.id) { heroID in
            HeroCardView(heroID: heroID)
        }
    }
}

struct HeroDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailsView()
            .environmentObject(HeroListViewModel())
    }
}

struct HeroCardView: View {
    @Environment(\.dismiss) var dismiss
    @State var heroID: HeroViewModel
    @State private var showDetails = false
    
    var body: some View {
        
        let combat = Int(heroID.combat) ?? 0
        let intelligence = Int(heroID.intelligence) ?? 0
        let strength = Int(heroID.strength) ?? 0
        let power = Int(heroID.power) ?? 0
        let speed = Int(heroID.speed) ?? 0
        let durability = Int(heroID.durability) ?? 0
        let overall = (intelligence + power + speed + strength + durability + combat)/6
        
        VStack {
            Button(action: {
                showDetails.toggle()
            }, label: {
                ZStack {
                    AsyncImage(url: heroID.image) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 155, height: 155)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        } else if phase.error != nil {
                            SwiftUI.Image("moon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 155, height: 155)
                                .background(Color(.black).opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        } else {
                            SearchingAnimationView()
                                .frame(width: 155, height: 155)
                                .shadow(color: Color(UIColor.systemFill), radius: 1, x: 5, y: 7)
                                .background(Color(UIColor.secondarySystemBackground))
                        }
                    }
                }
                
            })
                .sheet(isPresented: $showDetails) {
                    HeroDetails(heroID: heroID)
                }
            HStack {
                Text(heroID.name)
                    .frame(maxWidth: 155, alignment: .leading)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .padding(.horizontal, 8)
                
                Text("\(overall)")
            }
        }
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
                    SearchingAnimationView()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                        .shadow(color: Color(UIColor.systemFill), radius: 1, x: 5, y: 7)
                        .background(Color(UIColor.secondarySystemBackground))
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 40)
    }
}

struct HeroDetails: View {
    @EnvironmentObject var hero: HeroListViewModel
    @State var heroID: HeroViewModel
    @State private var showAlert = false
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
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
                                                  action: {hero.remove(hero: heroID);
                        HeroCardView(heroID: heroID).dismiss()}),
                          secondaryButton: .cancel(Text("No").foregroundColor(.red)))
                })
        }
    }
}
