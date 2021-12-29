//
//  HeroAppearanceView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import SwiftUI

struct HeroAppearanceView: View {
    @State var heroID: HeroViewModel
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            SwiftUI.Image("strength")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.vertical, 0)
            
            VStack(alignment: .leading) {
                Text("Appearance")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .blendMode(.overlay)
                    .padding(.vertical, 2)
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("Gender: ")
                        + Text(heroID.gender == "null" ? "Unknown" : heroID.gender)
                    }
                    HStack {
                        Text("Race: ")
                        + Text(heroID.race == "null" ? "Unknown" : heroID.race)
                    }
                    HStack {
                        Text("Height: ")
                        + Text(heroID.height[1] == "null" ? "Unknown" : heroID.height[1])
                    }
                    HStack {
                        Text("Weight: ")
                        + Text(heroID.weight[1] == "null" ? "Unknown" : heroID.weight[1])
                    }
                    HStack {
                        Text("Eye colour: ")
                        + Text(heroID.eyeColor == "null" ? "Unknown" : heroID.eyeColor)
                    }
                    HStack {
                        Text("Hair colour: ")
                        + Text(heroID.hairColor == "null" ? "Unknown" : heroID.hairColor)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .blendMode(.colorDodge)
                .opacity(0.5)
            }
            .padding(.horizontal)
        }
        .frame(width: 215, height: 250, alignment: .center)
        .padding(10)
        .background(LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), location: 1)
            ]), startPoint: .leading, endPoint: .bottomTrailing
        ).opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 5)
        .foregroundColor(.white)
    }
}


/* NOT SURE WHICH ARGUEMENT TO PASS IN FOR heroID
struct HeroAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        HeroAppearanceView(heroID: HeroViewModel)
    }
}
*/
