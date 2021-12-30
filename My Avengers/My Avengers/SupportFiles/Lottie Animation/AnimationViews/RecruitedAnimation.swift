//
//  RecruitedAnimation.swift
//  My Avengers
//
//  Created by Kha Tran on 30/12/21.
//

import SwiftUI

struct RecruitedAnimation: View {
    var body: some View {
        ZStack {
            LottieView(filename: "confetti-animation", fromFrame: 0, toFrame: 90)
                .frame(width: 500, height: 500)
                .shadow(color: Color.black.opacity(0.7), radius: 2, x: 2, y: 5)
        }
    }
}

struct RecruitedAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RecruitedAnimation()
    }
}
