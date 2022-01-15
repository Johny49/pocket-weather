//
//  ForecastCardView.swift
//  Pocket Weather
//
//  Created by Geoffrey Johnson on 1/7/22.
//

import SwiftUI

struct ForecastCardView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .foregroundColor(.white)
                VStack {
                    Text("Forecast Day")
                        .font(.title3)
                    Label("", systemImage: "cloud.rain")
                        .labelStyle(.iconOnly)
                }
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .aspectRatio(0.6, contentMode: .fit)
            .cornerRadius(12)
            .border(.gray, width: 1)
        }
        
    }
    }

struct ForecastCardView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCardView()
    }
}
