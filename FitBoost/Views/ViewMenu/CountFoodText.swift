//
//  CountFood.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI

struct CountFoodText: View {
    
    var nutritionaValueName: String
    
    var body: some View {
        Text(nutritionaValueName)
            .font(.headline)
            .fontWeight(.black)
            .foregroundColor(.white)
            
    }
}

struct CountFoodText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.gray
            CountFoodText(nutritionaValueName: "Calories: ")
        }
    }
}
