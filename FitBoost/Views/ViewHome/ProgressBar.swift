//
//  ProgressBar.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI
import CoreData

struct ProgressBar: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var progress: Double = 0.0
    var caloriesLeft: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 15)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(Color("LightBlueBrighter"), style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(-90))
                .onAppear {
                    let bmr = fetchBMRFromDatabase() // Pobierz wartość BMR z bazy danych
                    
                    withAnimation(.linear(duration: 1.2)) {
                        progress = 1 - (caloriesLeft / fetchBMRFromDatabase()) // Użyj pobranej wartości BMR
                    }
                }
            
            Capsule()
                .fill(Color("LightBlueBrighter"))
                .frame(width: 0, height: 7.5)
                .offset(x: 75, y: -75)
        }
        
        Text(String(format: "%.1f", caloriesLeft) + "\n calories left")
            .font(.headline)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
    
    private func fetchBMRFromDatabase() -> Double {
        var bmr: Double = 0.0
        
        let fetchRequest: NSFetchRequest<CaloricRequirement> = CaloricRequirement.fetchRequest()
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            if let caloricRequirement = results.first {
                bmr = caloricRequirement.bmr // Pobierz wartość BMR z encji "CaloricRequirement"
            }
        } catch {
            print("Error fetching BMR: \(error.localizedDescription)")
        }
        
        return bmr
    }
}


