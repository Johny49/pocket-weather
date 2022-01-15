//
//  ContentView.swift
//  Pocket Weather
//
//  Created by Geoffrey Johnson on 1/6/22.
//

import SwiftUI

struct MainContentView: View {
    let weatherMan = WeatherManager()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                VStack {
                    //Header and Searchbar
                    HStack() {
                        Menu() {
                            Text("Saved Location 1")
                            Text("Saved Location 2")
                            Text("Saved Location 3")
                        }label: {
                            Label("", systemImage: "note.text")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.white)
                                .accessibilityLabel("Saved Locations Menu Button")
                            
                        }
                        Text("Pocket Weather")
                            .font(.largeTitle)
                            .padding()
                        Button("ºF") {
                            // call function to toggle C/F
                        }
                        .foregroundColor(.white)
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: geometry.size.width * 0.9, height: 40)
                        .foregroundColor(.white)
                        .border(.gray, width: 2)
                    Spacer()
                    WeatherCardView()
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(spacing: -20) {
                            ForecastCardView()
                                .frame(width: 150, height: 200, alignment: .center)
                            ForecastCardView()
                                .frame(width: 150, height: 200, alignment: .center)
                            ForecastCardView()
                                .frame(width: 150, height: 200, alignment: .center)
                            ForecastCardView()
                                .frame(width: 150, height: 200, alignment: .center)
                            ForecastCardView()
                                .frame(width: 150, height: 200, alignment: .center)
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .onAppear {
                //call to test location to lat & lon function TODO: cleanup
                Task {
                    try await weatherMan.getLatLon(location: "Vancouver")
                }
            }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
