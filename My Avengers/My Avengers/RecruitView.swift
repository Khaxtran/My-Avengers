//
//  CreateTeamView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import Kingfisher
import SwiftUI

struct RecruitView: View {
    @EnvironmentObject var hero: HeroListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 200), spacing: 5),
                                    GridItem(.flexible(minimum: 100, maximum: 200))
                                   ], spacing: 10, content: {
                    
                    ZStack {
                        
                        Color.black.opacity(0.03)
                            .frame(width: 150, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: Color.black.opacity(0.9), radius: 10, x: 15, y: 25)
                        
                        Button(action: {
                           
                        }) {
                            VStack {
                                Text(SwiftUI.Image(systemName: "plus.circle.fill"))
                                    .font(.system(size: 45))
                                    .foregroundColor(Color.green)
                                    .symbolRenderingMode(.hierarchical)
                                Text("Add")
                                    .foregroundColor(Color.blue.opacity(0.7))
                                    .font(.system(size: 18, weight: .semibold))
                            }
                        }
                    }
                    .padding(.vertical, 5)
                    
                    ForEach(hero.recruits, id: \.id) { hero in
                        
                        ZStack {
                            
                            Color.black.opacity(0.03)
                                .frame(width: 150, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .shadow(color: Color.black.opacity(0.9), radius: 10, x: 15, y: 25)
                            
                            VStack {
                                KFImage(hero.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                                Spacer()
                                Text(hero.name)
                                    .font(.system(size: 17, weight: .semibold))
                                    .padding(.horizontal, 1)
                            }
                            .padding()
                            
                        }
                        .padding(.vertical, 5)
                    }
                    

                    
                })
                
            }
            .padding(10)
            .navigationTitle("Avengers")
        }
    }
}

struct RecruitView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitView()
            .environmentObject(HeroListViewModel())
    }
}
