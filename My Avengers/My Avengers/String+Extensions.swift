//
//  String+Extensions.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
