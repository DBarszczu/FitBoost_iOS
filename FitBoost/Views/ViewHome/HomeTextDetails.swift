//
//  HomeTextDetails.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct HomeTextDetails: View {
    var HomeTextDetails: String
    var action: () -> Void
    
    var body: some View {
        Text(HomeTextDetails)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(Color("LightBlue"))
    }
}

struct HomeTextDetails_Previews: PreviewProvider {
    static var previews: some View {
        HomeTextDetails(HomeTextDetails: "Details", action: {})
    }
}
