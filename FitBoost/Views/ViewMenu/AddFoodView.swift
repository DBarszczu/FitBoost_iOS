//
//  AddFoodView.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    @State private var fat: Double = 0
    @State private var protein: Double = 0
    @State private var carb: Double = 0
    
    @State private var caloriesS: String = ""
    
    var body: some View {
        VStack{
            Text("Calories per 100g")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
                
            Form {
                Section() {
                    
                    
                    TextField("Food name", text: $name)
                    
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
                            DataController().addFood(
                                name: name,
                                calories: calories,
                                fat: fat,
                                protein: protein,
                                carb: carb,
                                context: managedObjContext)
                            dismiss()
                        }) {
                            Text("Submit")
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }

                
                }
            }
        }
    }
}
struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
