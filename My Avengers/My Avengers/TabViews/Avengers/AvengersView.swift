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
        
        ZStack {
            GeometryReader { geo in
                
                LinearGradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.3)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: geo.size.width, height: 500)
                    .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.6), Color.mint.opacity(0.2)],
                                                    startPoint: .top,
                                                    endPoint: .leading))
                    .blur(radius: 20)
                    .offset(x: 300)
                    .rotationEffect(.degrees(30))
                
                Circle()
                    .frame(width: 300)
                    .foregroundColor(Color.blue.opacity(0.3))
                    .blur(radius: 10)
                    .offset(x:-100, y: -150)
            }
            
            ScrollView(showsIndicators: false) {
                    ForEach(hero.recruits, id: \.id) { heroID in
                        SmallCardView(heroID: heroID)
                    }
                    .padding()
            }
            .padding(.top, 60)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct AvengersView_Previews: PreviewProvider {
    static var previews: some View {
        AvengersView().environmentObject(HeroListViewModel())
    }
}


struct SmallCardView: View {
    @State var heroID: HeroViewModel
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showDetails.toggle()
                }
            }, label: {
                HStack {
                    VStack(alignment: .center) {
                        LoadingHeroImageView(heroImage: heroID.image)
                    }
                    .shadow(color: Color(.black).opacity(0.2), radius: 2, x: 2, y: 2)
                    Spacer()
                    VStack(alignment: .center) {
                        Text("\(heroID.name)".uppercased())
                            .font(.system(size: 18, weight: .bold, design: .rounded))
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
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            })
            
            if showDetails {
                //Medium card
                withAnimation {
                    MediumCardView(heroID: heroID)
                        .transition(.asymmetric(insertion: .offset(y: -15), removal: .offset(y: -15)))
                }
            }
        }
    }
}

struct MediumCardView: View {
    @State var heroID: HeroViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("\(heroID.name)".uppercased())
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
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
                            SwiftUI.Image(systemName: "trash")
                                .font(.system(size: 20))
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
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundColor(Color(.black).opacity(0.8))
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
