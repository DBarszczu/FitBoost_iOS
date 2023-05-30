//
//  EditFoodView.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var modifiedfood: FetchedResults<ModifiedFood>.Element
    var selectedDate: Date
    
    @State private var name = ""
    @State private var calories: Double = 0
    @State private var fat: Double = 0
    @State private var protein: Double = 0
    @State private var carb: Double = 0
    
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Enter the name", text: $name)
                }
                
                HStack {
                    Text("Calories: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Enter the calories", value: $calories, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("Fat: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Enter the fat", value: $fat, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("Protein: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Enter the protein", value: $protein, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("Carb: ")
                        .frame(width: 100, alignment: .leading)
                    
                    TextField("Enter the carb", value: $carb, formatter: NumberFormatter())
                }
                HStack{
                    Spacer()
                    Button(action: updateFood) {
                        Text("Update")
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
            }
            
               
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        name = modifiedfood.name ?? ""
        calories = modifiedfood.calories
        fat = modifiedfood.fat
        protein = modifiedfood.protein
        carb = modifiedfood.carb
    }
    
    private func updateFood() {
        modifiedfood.name = name
        modifiedfood.calories = calories
        modifiedfood.fat = fat
        modifiedfood.protein = protein
        modifiedfood.carb = carb
        modifiedfood.date = selectedDate
        
        DataController().save(context: managedObjContext)
        
        dismiss()
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView(modifiedfood: ModifiedFood(), selectedDate: Date())
//    }
//}
