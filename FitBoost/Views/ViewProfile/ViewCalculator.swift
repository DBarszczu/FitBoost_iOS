//
//  ViewCalculator.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 26/05/2023.
//

import SwiftUI
import CoreData

struct ViewCalculator: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""
    @State private var selectedGender = 0
    @State private var selectedActivityLevel = 0
    @State private var calculatedBMR: Double = 0
    
    let genderOptions = ["Male", "Female"]
    let activityLevels = [
        ActivityLevel(description: "Sedentary", multiplier: 1.2),
        ActivityLevel(description: "Lightly Active", multiplier: 1.375),
        ActivityLevel(description: "Moderately Active", multiplier: 1.55),
        ActivityLevel(description: "Very Active", multiplier: 1.725)
    ]
    
    var body: some View {
        VStack {
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .padding()
            
            TextField("Weight (kg)", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
            
            TextField("Height (cm)", text: $height)
                .keyboardType(.decimalPad)
                .padding()
            
            Picker("Gender", selection: $selectedGender) {
                ForEach(0..<genderOptions.count, id: \.self) { index in
                    Text(genderOptions[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Activity Level", selection: $selectedActivityLevel) {
                ForEach(0..<activityLevels.count, id: \.self) { index in
                    Text(activityLevels[index].description)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button(action: calculateCaloricRequirement) {
                Text("Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Text("Calculated BMR: \(calculatedBMR, specifier: "%.2f")")
                .font(.headline)
                .padding()
        }
    }
    
    func calculateCaloricRequirement() {
        guard let age = Int16(age),
              let weight = Double(weight),
              let height = Double(height) else {
            return
        }
        
        let gender = genderOptions[selectedGender]
        let activityLevel = activityLevels[selectedActivityLevel].multiplier
        
        let bmr = calculateBMR(age: age, weight: weight, height: height, gender: gender)
        let caloricRequirement = bmr * activityLevel
        
        calculatedBMR = caloricRequirement
        
        saveCaloricRequirement(bmr: caloricRequirement)
    }
    
    func calculateBMR(age: Int16, weight: Double, height: Double, gender: String) -> Double {
        var bmr: Double = 0
        
        if gender == "Male" {
            bmr = 10 * weight + 6.25 * height - 5 * Double(age) + 5
        } else if gender == "Female" {
            bmr = 10 * weight + 6.25 * height - 5 * Double(age) - 161
        }
        
        return bmr
    }
    
    func saveCaloricRequirement(bmr: Double) {
        let fetchRequest: NSFetchRequest<CaloricRequirement> = CaloricRequirement.fetchRequest()
        do {
            let caloricRequirements = try viewContext.fetch(fetchRequest)
            if let existingRequirement = caloricRequirements.first {
                existingRequirement.bmr = bmr
            } else {
                let caloricRequirement = CaloricRequirement(context: viewContext)
                caloricRequirement.bmr = bmr
            }
            
            try viewContext.save()
        } catch {
            // Handle the error
        }
    }
}

struct ActivityLevel: Identifiable {
    let id = UUID()
    let description: String
    let multiplier: Double
}

struct ViewCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ViewCalculator()
    }
}
