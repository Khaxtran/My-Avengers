//
//  SearchingAnimationView.swift
//  My Avengers
//
//  Created by Kha Tran on 30/1/2022.
//

import SwiftUI

struct SearchingAnimationView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading-dots-animation", fromFrame: 0, toFrame: 50, speed: 1.5)
        }
        .frame(width: 60, height: 60)
    }
}

struct SearchingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingAnimationView()
    }
}
