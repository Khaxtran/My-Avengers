//
//  CreateTeamView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import SwiftUI

struct CreateTeamView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                List() {
                    
                }
                .navigationTitle("Create new team")
            }
            .background(Color.white)
        }
    }
}

struct CreateTeamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamView()
    }
}
