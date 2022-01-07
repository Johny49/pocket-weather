//
//  WeatherCardView.swift
//  Pocket Weather
//
//  Created by Geoffrey Johnson on 1/6/22.
//

import SwiftUI

struct WeatherCardView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .foregroundColor(.white)
                VStack {
                    Label("32", systemImage: "cloud.rain")
                    .labelStyle(.titleAndIcon)
                    .font(.largeTitle)
                    Text("Some Weather Here")
                }
            }
            .frame(width: geometry.size.width * 0.9, alignment: .center)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .aspectRatio(1, contentMode: .fit)
        }
    }
}


struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCardView()
    }
}
