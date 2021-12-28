//
//  My_AvengersApp.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21. 
//

import SwiftUI

@main
struct My_AvengersApp: App {
    @StateObject var hero = HeroListViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(hero)
        }
    }
}
