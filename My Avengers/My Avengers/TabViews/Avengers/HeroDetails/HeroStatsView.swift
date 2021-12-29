//
//  HeroStatsView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import SwiftUI

struct HeroStatsView: View {
    @State var icon: String
    @State var iconTitle: String
    @State var iconStats: String
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
                        Text(self.iconStats)
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
                .shadow(color: Color.black.opacity(0.2), radius: 1, x: 4, y: 4)
                .foregroundColor(.white)
                
                Text(self.iconTitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color.black)
                    .opacity(0.7)
                    .shadow(color: Color.black.opacity(0.4), radius: 1, x: 6, y: 4)
            }
            
            
        }

        
        
    }
        
}

/*
struct HeroStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroStatsView()
    }
}
 Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
 Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
*/
