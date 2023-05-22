//
//  TrainingButton.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct TrainingButton: View {
    let buttonText: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(buttonText)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 150)
                .background(Color("DarkGrey"))
                .cornerRadius(15)

        }
    }
}

struct TrainingButton_Previews: PreviewProvider {
    static var previews: some View {
        TrainingButton(buttonText: "CHEST", destination: AnyView(ViewChest()))
    }
}
   
