//
//  ViewE.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewProfile: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading){
                    NavigationLink(destination: ViewPersonalData()) {
                        ProfileItem(profileText: "Personal data", profileImage: "person.fill")
                    }
                    
                    NavigationLink(destination: ViewCalculator()) {
                        ProfileItem(profileText: "Calculator", profileImage: "equal.square.fill")
                    }
                    NavigationLink(destination: ViewSettings()) {
                        ProfileItem(profileText: "Settings", profileImage: "gearshape.fill")
                    }
                    
                    Spacer()
                }
                .padding(.trailing, 100.0)
            }
            .padding()
            .navigationBarTitle("Profile")
        }
    }
}

struct ViewProfile_Previews: PreviewProvider {
    static var previews: some View {
        ViewProfile()
    }
}
