//
//  HeroStatsView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import SwiftUI

struct StatsIconView: View {
    @State var icon: String
    @State var title: String
    @State var stats: Int
    @State var backgroundColor1: Color
    @State var backgroundColor2: Color
    
    var body: some View {
        
        HStack {
            VStack {
                VStack {
                    VStack {
                        SwiftUI.Image(self.icon)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                        Text("\(self.stats)")
                            .font(.system(size: 15, weight: .bold))
                            .blendMode(.overlay)
                    }
                    
                }
                .frame(width: 45, height: 45, alignment: .center)
                .padding(10)
                .background(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: self.backgroundColor1, location: 0),
                        .init(color: self.backgroundColor2, location: 1)
                    ]), startPoint: .leading, endPoint: .bottomTrailing
                ).opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 1, x: 2, y: 2)
                .foregroundColor(.white)
                
                Text(self.title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color.black)
                    .opacity(0.7)
                    .shadow(color: Color.black.opacity(0.4), radius: 1, x: 6, y: 4)
            }
            
            
        }

        
        
    }
        
}


