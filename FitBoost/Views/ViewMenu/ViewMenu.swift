//
//  ViewModifiedMenu.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 22/05/2023.
//

import SwiftUI
import CoreData

struct ViewMenu: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var modifiedfood: FetchedResults<ModifiedFood>
    @FetchRequest(entity: CaloricRequirement.entity(), sortDescriptors: []) var caloricRequirements: FetchedResults<CaloricRequirement>
    
    @State private var showingAddView = false
    @State private var selectedDate = Date()
    @State private var bmr: Double = 0
    
    private var currentDayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: selectedDate)
    }
    
    private func previousDay() {
        guard let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) else {
            return
        }
        selectedDate = previousDate
    }
    
    private func nextDay() {
        guard let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) else {
            return
        }
        selectedDate = nextDate
    }
    
    private var modifiedFoodForSelectedDay: [ModifiedFood] {
        modifiedfood.filter { Calendar.current.isDate($0.date!, inSameDayAs: selectedDate) }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: previousDay) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                            .padding()
                    }
                    Spacer()
                    Text(currentDayOfWeek)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Button(action: nextDay) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 30))
                            .padding()
                    }
                }
                
                List {
                    ForEach(modifiedFoodForSelectedDay) { modifiedfood in
                        NavigationLink(destination: EditFoodView(modifiedfood: modifiedfood, selectedDate: selectedDate)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(modifiedfood.name!)
                                        .bold()
                                    
                                    Text("\(String(format: "%.1f", Double(modifiedfood.calories)))")
                                        .fontWeight(.semibold) +
                                        Text(" kcal")
                                            .foregroundColor(.red)
                                            .fontWeight(.regular)
                                }
                                Spacer()
                                Text(calcTimeSince(date: modifiedfood.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }.onDelete(perform: deleteFood)
                }  .listStyle(.plain)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 3)
//                    )
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .padding(10)
                
                HStack {
                    Spacer().background(Color.black.frame(height: 0.5))
                    NavigationLink("  List of products  ", destination: ViewMenuListOfProducts())
                        .font(.title3)
                        .fontWeight(.bold)
                        
                    
                    Spacer().background(Color.black.frame(height: 0.5))
                }
                
                ZStack {
                    Color("DarkGrey")
                        .frame(height: 140)
                        .cornerRadius(15)
                    
                    VStack {
                        HStack {
                            VStack {
                                CountFoodText(nutritionaValueName: "Calories:")
                                    .padding(.bottom, 0.1)
                                CountFoodValue(nutritionaValueCount: "\(String(format: "%.1f", Double(totalCaloriesToday())))")
                            }
                            .padding(.horizontal, 5.0)
                            VStack {
                                CountFoodText(nutritionaValueName: "Fat:")
                                    .padding(.bottom, 0.1)
                                CountFoodValue(nutritionaValueCount: "\(String(format: "%.1f", Double(totalFatToday())))")
                            }
                            .padding(.horizontal, 5.0)
                            VStack {
                                CountFoodText(nutritionaValueName: "Proteins:")
                                    .padding(.bottom, 0.1)
                                CountFoodValue(nutritionaValueCount: "\(String(format: "%.1f", Double(totalProteinToday())))")
                            }
                            .padding(.horizontal, 5.0)
                            VStack {
                                CountFoodText(nutritionaValueName: "Carbs:")
                                    .padding(.bottom, 1.0)
                                CountFoodValue(nutritionaValueCount: "\(String(format: "%.1f", Double(totalCarbToday())))")
                            }
                            .padding(.horizontal, 5.0)
                        }
                        VStack{
                            ZStack{
                                HStack {
                                    ProgressBarFlat(maxValue: fetchBMRFromDatabase(), currentValue: totalCaloriesToday())
                                }
                                
                                
                                HStack {
                                    CountFoodValue(nutritionaValueCount: "\(String(format: "%.1f", Double(totalCaloriesTodayLeft())))")
                                    
                                    CountFoodText(nutritionaValueName: " calories left")
                                }
                                .padding(.top, 14.0)
                                
                            }
                            .padding(.horizontal, 15.0)
                        }
                    }
                }.padding(10)
               
            }
            
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
        .navigationViewStyle(.stack)
        .onAppear(perform: loadBMR)
        
     
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
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { modifiedFoodForSelectedDay[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    
    private func totalCaloriesToday() -> Double {
        modifiedFoodForSelectedDay.reduce(0) { $0 + $1.calories }
    }
    
    private func totalCaloriesTodayLeft() -> Double {
        bmr - totalCaloriesToday()
    }
    
    private func totalFatToday() -> Double {
        modifiedFoodForSelectedDay.reduce(0) { $0 + $1.fat }
    }
    
    private func totalProteinToday() -> Double {
        modifiedFoodForSelectedDay.reduce(0) { $0 + $1.protein }
    }
    
    private func totalCarbToday() -> Double {
        modifiedFoodForSelectedDay.reduce(0) { $0 + $1.carb }
    }
    
    private func loadBMR() {
        if let caloricRequirement = caloricRequirements.first {
            bmr = caloricRequirement.bmr
        }
    }
}


//struct ViewMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewMenu()
//    }
//}
