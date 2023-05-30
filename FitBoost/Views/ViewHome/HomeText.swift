//
//  HomeText.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct HomeText: View {
    
    var HomeText: String
    var body: some View {
        Text(HomeText)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color(hue: 1.0, saturation: 0.103, brightness: 0.277))
    }
}

struct HomeText_Previews: PreviewProvider {
    static var previews: some View {
        HomeText(HomeText: "Summary")
    }
}
