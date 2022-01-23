//
//  LoadingView.swift
//  My Avengers
//
//  Created by Kha Tran on 30/12/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading-animation", fromFrame: 0, toFrame: 150, speed: 1)
                .frame(width: 400, height: 400)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
