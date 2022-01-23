//
//  Swipe+Extensions.swift
//  My Avengers
//
//  Created by Kha Tran on 20/1/2022.
//

import UIKit
import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
