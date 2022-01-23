//
//  LoadingImageView.swift
//  My Avengers
//
//  Created by Kha Tran on 23/1/2022.
//

import SwiftUI

struct LoadingImageView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading-image", fromFrame: 50, toFrame: 301, speed: 1)
        }
    }
}

struct LoadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImageView()
    }
}
