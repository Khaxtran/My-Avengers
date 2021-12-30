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
            LottieView(filename: "loading-animation", fromFrame: 0, toFrame: 150)
                .frame(width: 250, height: 250)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
