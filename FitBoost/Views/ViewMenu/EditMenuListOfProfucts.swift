//
//  EditFoodView.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI

struct EditMenuListOfProfucts: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    @State private var fat: Double = 0
    @State private var protein: Double = 0
    @State private var carb: Double = 0
    
    @State private var initialValue: Double = 0.0
    
    @State private var modifiedName = ""
    @State private var modifiedCalories: Double = 0
    @State private var modifiedFat: Double = 0
    @State private var modifiedProtein: Double = 0
    @State private var modifiedCarb: Double = 0
    
    func copyAndModifyFoodData() {
        modifiedName = food.name!
        modifiedCalories = food.calories
        modifiedFat = food.fat
        modifiedProtein = food.protein
        modifiedCarb = food.carb
    }
    
    var body: some View {
        
        Form {
            Section {
                
                HStack {
                    Text("Name: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("\(food.name!)", text: $name)
                        .onAppear {
                            name = food.name!
                            calories = food.calories
                            fat = food.fat
                            protein = food.protein
                            carb = food.carb
                            copyAndModifyFoodData()
                        }
                }
                HStack {
                    Text("Calories: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Calories:", value: $calories, format: .currency(code: ""))
                        .keyboardType(.numberPad)
                }

                HStack {
                    Text("Fat: ").frame(width: 100, alignment: .leading)
                    TextField("Fat:", value: $fat, format: .currency(code: ""))
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Protein: ").frame(width: 100, alignment: .leading)
                    TextField("Protein:", value: $protein, format: .currency(code: ""))
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Carb: ").frame(width: 100, alignment: .leading)
                    TextField("Carb:", value: $carb, format: .currency(code: ""))
                        .keyboardType(.numberPad)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        DataController().editFood(food: food, name: name, calories: calories, fat: fat, protein: protein, carb: carb, context: managedObjContext)
                        
                        dismiss()
                    }) {
                        Text("Submit")
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                
            }
            VStack {
                Text("Enter the weight (g): \(String(format: "%.2f", initialValue))")
                Slider(value: $initialValue, in: 0...1000, step: 1)
            }.padding()
            
            
            
            HStack {
                Spacer()
                Button(action: {
                    let multipliedCalories = (modifiedCalories * initialValue / 100).rounded(toPlaces: 1)
                    let multipliedFat = (modifiedFat * initialValue / 100).rounded(toPlaces: 1)
                    let multipliedProtein = (modifiedProtein * initialValue / 100).rounded(toPlaces: 1)
                    let multipliedCarb = (modifiedCarb * initialValue / 100).rounded(toPlaces: 1)
                    
                    DataController().addModifiedFood(name: modifiedName, calories: multipliedCalories, fat: multipliedFat, protein: multipliedProtein, carb: multipliedCarb, context: managedObjContext)
                    dismiss()
                    
                }) {
                        Text("Add to list")
                        .fontWeight(.bold)
                    }
                Spacer()
            }
        }
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
