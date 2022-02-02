//
//  AvengersView.swift
//  My Avengers
//
//  Created by Kha Tran on 2/2/2022.
//

import Kingfisher
import SwiftUI

struct AvengersView: View {
    @EnvironmentObject var hero: HeroListViewModel
    
    var body: some View {
        
        GeometryReader { geo in
        
            ZStack {
                
                LinearGradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.3)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: geo.size.width, height: 500)
                    .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.6), Color.mint.opacity(0.5)],
                                                    startPoint: .top,
                                                    endPoint: .leading))
                    .blur(radius: 10)
                    .offset(x: 300)
                    .rotationEffect(.degrees(30))
                
                Circle()
                    .frame(width: 300)
                    .foregroundColor(Color.blue.opacity(0.3))
                    .blur(radius: 10)
                    .offset(x:-100, y: -150)
                
                GeometryReader { geo in
                    //Small card
                    VStack(spacing: 10) {
                        HStack {
                            VStack(alignment: .center) {
                                Circle()
                                    .frame(width: 50, height: 50, alignment: .center)
                            }
                            .shadow(color: Color(.black).opacity(0.2), radius: 2, x: 2, y: 2)
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Date")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Text("DATE ADDED")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                            }
                            .shadow(color: Color(.black).opacity(0.1), radius: 0.5, x: 2, y: 2)
                            Spacer()
                            VStack(alignment: .center) {
                                Text("89")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                Text("OVERALL")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                            }
                            .foregroundColor(.green)
                            .shadow(color: Color(.black).opacity(0.1), radius: 0.5, x: 2, y: 2)
                            
                        }
                        .padding()
                        .frame(width: geo.size.width, alignment: .center)
                        .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        
                        //Medium card
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Hero name".uppercased())
                                .font(.headline)
                                .padding()
                            VStack(alignment: .leading) {
                                Text("Fullname: Peter Parker")
                                    .font(.system(size: 16, weight: .regular, design: .rounded))
                                    .padding(.bottom, 2)
                                Text("Race: Human")
                                    .font(.system(size: 16, weight: .regular, design: .rounded))
                            }
                            .padding([.horizontal, .bottom])
                            .frame(width: geo.size.width, alignment: .leading)
                            
                            HStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    SwiftUI.Image(systemName: "person.fill")
                                        .font(.system(size: 30))
                                    Text("GENDER")
                                        .font(.system(size: 12, weight: .regular, design: .rounded))
                                        .padding(.vertical, 0.5)
                                }
                                Spacer()
                                VStack(alignment: .center) {
                                    Text("Group name")
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                    Text("GROUP")
                                        .font(.system(size: 12, weight: .regular, design: .rounded))
                                        .padding(.vertical, 0.5)
                                }
                                Spacer()
                                VStack(alignment: .center) {
                                    Button(action: {
                                        print("do nothing")
                                    }, label: {
                                        VStack(alignment: .center)  {
                                            SwiftUI.Image(systemName: "trash.square.fill")
                                                .font(.system(size: 30))
                                                .foregroundColor(.red)
                                            Text("REMOVE")
                                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                                .padding(.vertical, 0.5)
                                        }
                                    })
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .padding()
                        }
                        .frame(width: geo.size.width, alignment: .center)
                        .foregroundColor(Color(.black).opacity(0.8))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct AvengersView_Previews: PreviewProvider {
    static var previews: some View {
        AvengersView().environmentObject(HeroListViewModel())
    }
}
