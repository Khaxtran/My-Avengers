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
                Divider()
                    .padding()
                LazyVGrid(columns: [GridItem(.flexible(minimum: 200, maximum: 400), spacing: 0)],
                          content: {
                        ForEach(0..<5, id: \.self) { num in
                            Text("Team A")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .font(.system(size: 25, weight: .semibold))
                            LazyVGrid(columns: [
                                GridItem(.flexible(minimum: 100, maximum: 200), spacing: 0),
                                GridItem(.flexible(minimum: 100, maximum: 200),spacing: 0),
                                GridItem(.flexible(minimum: 100, maximum: 200))
                            ], spacing: 0, content: {
                                ForEach(0..<6, id: \.self) { num in
                                    VStack(alignment: .leading) {
                                        Spacer()
                                            .frame(width: 80, height: 80)
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                        Text("Name")
                                        
                                    }
                                    .padding(10)
                                }
                                
                            })
                            .navigationTitle("My Avengers")
                            .background(Color.init(hue: 0.1, saturation: 0.1, lightness: 0.0, opacity: 0.07))
                            .cornerRadius(10)
                    }
                })
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
