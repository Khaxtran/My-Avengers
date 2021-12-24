//
//  HomeView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State var selectedIndex = 0
    
    let tabBarImages = ["person.2.crop.square.stack","plus.app.fill","magnifyingglass"]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    MyAvengersView()
                case 1:
                    CreateTeamView()
                default:
                    SearchView()
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<3) { num in
                    Button(action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 1 {
                            SwiftUI.Image(systemName: tabBarImages[num])
                                .font(.system(size: 35, weight: .bold))
                                .foregroundColor(.blue)
                        } else {
                            SwiftUI.Image(systemName: tabBarImages[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.label) :
                                                        .init(white: 0.3))
                        }
                        Spacer()
                    })
                }
            }
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

