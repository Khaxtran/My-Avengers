//
//  HeroBiographyView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import Kingfisher
import SwiftUI

struct HeroStatsView: View {
    @State var heroID: HeroViewModel
    
    var body: some View {
        
        VStack {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100, maximum: 200), spacing: 0),
                GridItem(.flexible(minimum: 100, maximum: 200),spacing: 0),
                GridItem(.flexible(minimum: 100, maximum: 200))
            ], spacing: 8, content: {
                
                StatsIconView(icon: "power", iconTitle: "Power", iconStats: heroID.power, backgroundColor1: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                StatsIconView(icon: "speed", iconTitle: "Speed", iconStats: heroID.speed, backgroundColor1: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                StatsIconView(icon: "strength", iconTitle: "Strength", iconStats: heroID.strength, backgroundColor1: Color(#colorLiteral(red: 0.2298563719, green: 0.4019652009, blue: 0.9731406569, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                StatsIconView(icon: "intelligence", iconTitle: "Intelligence", iconStats: heroID.intelligence, backgroundColor1: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                StatsIconView(icon: "durability", iconTitle: "Durability", iconStats: heroID.durability, backgroundColor1: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                StatsIconView(icon: "combat", iconTitle: "Combat", iconStats: heroID.combat, backgroundColor1: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), backgroundColor2: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
            })
                .padding(.horizontal, 48)
                .padding(.vertical)
        }
        .frame(width: 310, height: 210, alignment: .center)
        .padding()
        .background(LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), location: 1)
            ]), startPoint: .leading, endPoint: .bottomTrailing
        ).opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 5)
    }
}


/*
struct HeroStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroStatsView()
    }
}
*/
