//
//  HeroBiographyView.swift
//  My Avengers
//
//  Created by Kha Tran on 29/12/21.
//

import SwiftUI

struct HeroBiographyView: View {
    @State var heroID: HeroViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            SwiftUI.Image("strength")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.vertical, 0)
            
            VStack(alignment: .leading) {
                Text("Biography")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .blendMode(.overlay)
                    .padding(.vertical, 2)
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("Full name: ").fontWeight(.bold)
                        + Text(heroID.fullName == "null" ? "Unknown" : heroID.fullName)
                    }
                    HStack {
                        Text("Race: ").fontWeight(.bold)
                        + Text(heroID.race == "null" ? "Unknown" : heroID.race)
                    }
                    HStack {
                        Text("Place of birth: ").fontWeight(.bold)
                        + Text(heroID.placeOfBirth == "null" ? "Unknown" : heroID.placeOfBirth)
                    }
                    HStack(spacing: 0.0) {
                        Text("Publisher: ").fontWeight(.bold)
                        + Text(heroID.universe == "null" ? "Unknown" : heroID.universe)
                    }
                    
                }
                .fixedSize(horizontal: false, vertical: true)
                .blendMode(.colorDodge)
                .opacity(0.5)
                .font(.system(size: 16))
            }
            .padding(.horizontal)
        }
        .frame(width: 215, height: 250, alignment: .top)
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

/*
struct HeroBiographyView_Previews: PreviewProvider {
    static var previews: some View {
        HeroBiographyView()
    }
}
*/
