//
//  ViewB.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewTraining: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TrainingButton(buttonText: "CHEST", destination: AnyView(ViewChest()))
                        TrainingButton(buttonText: "SHOULDERS", destination: AnyView(ViewShoulders()))
                    }
                    HStack {
                        TrainingButton(buttonText: "BICEPS", destination: AnyView(ViewBiceps()))
                        TrainingButton(buttonText: "TRICEPS", destination: AnyView(ViewTricpes()))
                    }
                    HStack {
                        TrainingButton(buttonText: "BACK", destination: AnyView(ViewBack()))
                        TrainingButton(buttonText: "BUTTOCKS", destination: AnyView(ViewButtocks()))
                    }
                    HStack {
                        TrainingButton(buttonText: "LEGS", destination: AnyView(ViewLegs()))
                        TrainingButton(buttonText: "BELLY", destination: AnyView(ViewBelly()))
                    }
                    
                }
            }
            
        }
    }
}

struct ViewTraining_Previews: PreviewProvider {
    static var previews: some View {
        ViewTraining()
    }
}

