//
//  ViewB.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewTraining: View {
    var body: some View {
        ZStack{
            Color.green
            
            Image(systemName: "figure.strengthtraining.traditional")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewTraining_Previews: PreviewProvider {
    static var previews: some View {
        ViewTraining()
    }
}
