//
//  ViewA.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI
import CoreData

struct ViewHome: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var modifiedfood: FetchedResults<ModifiedFood>

    
    
    @State private var selectedDate = Date()

    
    private var modifiedFoodForSelectedDay: [ModifiedFood] {
        modifiedfood.filter { Calendar.current.isDate($0.date!, inSameDayAs: selectedDate) }
    }
    
    private var currentDayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Text(currentDayOfWeek)
                        .fontWeight(.black)
                        .foregroundColor(Color("LightBlue"))
                        .font(.title)
                        .padding(.bottom, 10.0)
                    
                    
               
                }.padding(.leading)
                HStack{
                    HomeText(HomeText: "Summary")
                        .padding(.top, 0.0)
                    Spacer()
                    HomeTextDetails(HomeTextDetails: "Details", action: {})
                }.padding(.horizontal, 20.0)
                ZStack {
                    Color("DarkGrey")
                        .frame(height: 200)
                        .cornerRadius(15)
                    ProgressBar(caloriesLeft: totalCaloriesTodayLeft())
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
    private func totalCaloriesToday() -> Double {
        modifiedFoodForSelectedDay.reduce(0) { $0 + $1.calories }
    }
    
    var caloricRequirement: Double = 3000
    
    private func totalCaloriesTodayLeft() -> Double {
        fetchBMRFromDatabase() - totalCaloriesToday()
    }
    private func fetchBMRFromDatabase() -> Double {
        var bmr: Double = 0.0
        
        let fetchRequest: NSFetchRequest<CaloricRequirement> = CaloricRequirement.fetchRequest()
        
        do {
            let results = try managedObjContext.fetch(fetchRequest)
            if let caloricRequirement = results.first {
                bmr = caloricRequirement.bmr // Pobierz wartość BMR z encji "CaloricRequirement"
            }
        } catch {
            print("Error fetching BMR: \(error.localizedDescription)")
        }
        
        return bmr
    }
    
}


//struct ViewHome_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewHome()
//    }
//}
