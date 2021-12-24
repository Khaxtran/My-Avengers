//
//  MyAvengersView.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation
import SwiftUI

struct MyAvengersView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                List() {
                    
                }
                .navigationTitle("My Avengers")
            }
            .background(Color.white)
        }
    }
}

struct MyAvengersView_Previews: PreviewProvider {
    static var previews: some View {
        MyAvengersView()
    }
}
