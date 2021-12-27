//
//  UIImage+Extensions.swift
//  My Avengers
//
//  Created by Kha Tran on 26/12/21.
//

import Foundation
import UIKit

extension UIImage {
    
    static func image(iconType: IconType) -> UIImage {
        let image = UIImage(named: iconType.rawValue)!.withRenderingMode(.alwaysTemplate)
        return image
    }
    
}
