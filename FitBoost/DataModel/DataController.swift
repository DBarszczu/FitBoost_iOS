//
//  DataController.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addFood(name: String, calories: Double, fat: Double, protein: Double, carb: Double, context: NSManagedObjectContext) {
        let food = Food (context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        food.fat = fat
        food.protein = protein
        food.carb = carb
        
        save(context: context)
    }
    
    func addModifiedFood(name: String, calories: Double, fat: Double, protein: Double, carb: Double, context: NSManagedObjectContext) {
        let modifiedfood = ModifiedFood (context: context)
        modifiedfood.id = UUID()
        modifiedfood.date = Date()
        modifiedfood.name = name
        modifiedfood.calories = calories
        modifiedfood.fat = fat
        modifiedfood.protein = protein
        modifiedfood.carb = carb
        
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, fat: Double, protein: Double, carb: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories
        food.fat = fat
        food.protein = protein
        food.carb = carb
        
        save(context: context)
    }
    
    func editModifiedFood(modifiedfood: ModifiedFood, name: String, calories: Double, fat: Double, protein: Double, carb: Double, context: NSManagedObjectContext) {
        modifiedfood.date = Date()
        modifiedfood.name = name
        modifiedfood.calories = calories
        modifiedfood.fat = fat
        modifiedfood.protein = protein
        modifiedfood.carb = carb
        
        save(context: context)
    }
    
    func addcaloricRequirement(bmr: Double, context: NSManagedObjectContext) {
        let caloricRequirement = CaloricRequirement (context: context)
        caloricRequirement.id = UUID()
        caloricRequirement.date = Date()
        caloricRequirement.bmr = bmr
      
        
        save(context: context)
    }
    
    func editcaloricRequirement(caloricRequirement: CaloricRequirement, bmr: Double, context: NSManagedObjectContext) {
        caloricRequirement.date = Date()
        caloricRequirement.bmr = bmr
       
        save(context: context)
    }
}




