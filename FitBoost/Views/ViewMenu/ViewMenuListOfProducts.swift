//
//  ViewC.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI
import CoreData

struct ViewMenuListOfProducts: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    
    @State private var showingAddView = false
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("List of products")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Spacer()
            }
            HStack{
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("Search product", text: $searchText)
                    .padding(.horizontal)
                    .frame( height: 40)
                    .onChange(of: searchText) { _ in
                        // Perform search or filter logic here
                    }
            } .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            .padding(8)
            
            
            
            
            
            
            
            
            
            
            List {
                ForEach(filteredFood) { food in
                    NavigationLink(destination: EditMenuListOfProfucts(food: food)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(food.name!)
                                    .bold()
                                
                                Text("\(String(format: "%.1f", Double(food.calories)))")
                                    .fontWeight(.semibold) +
                                Text(" kcal")
                                    .foregroundColor(.red)
                                    .fontWeight(.regular)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteFood)
            }
            .listStyle(.plain)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddView.toggle()
                } label: {
                    Label("Add food", systemImage: "plus.app.fill")
                }
            }
        }
        .sheet(isPresented: $showingAddView) {
            AddFoodView()
        }
        .navigationViewStyle(.stack)
    }
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { food[$0] }.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
        }
    }
    
    private var filteredFood: [Food] {
        if searchText.isEmpty {
            return food.sorted { $0.name! < $1.name! }
        } else {
            return food.filter { $0.name!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ViewMenuListOfProducts_Previews: PreviewProvider {
    static var previews: some View {
        ViewMenuListOfProducts()
    }
}

