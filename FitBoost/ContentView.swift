//
//  ContentView.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ViewHome()
                .tabItem(){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ViewTraining()
                .tabItem(){
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("Training")
                }
            ViewMenu()
                .tabItem(){
                    Image(systemName: "menucard.fill")
                    Text("Menu")
                }
            ViewDiet()
                .tabItem(){
                    Image(systemName: "fork.knife")
                    Text("Diet")
                }
            ViewProfile()
                .tabItem(){
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
