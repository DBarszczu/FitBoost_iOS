//
//  CountFoodValue.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI

struct CountFoodValue: View {
    
    var nutritionaValueCount: String
    
    var body: some View {
        Text(nutritionaValueCount)
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(.white)
            
    }
}

struct CountFoodValue_Previews: PreviewProvider {
    static var previews: some View {
        CountFoodValue(nutritionaValueCount: "60.5")
    }
}
