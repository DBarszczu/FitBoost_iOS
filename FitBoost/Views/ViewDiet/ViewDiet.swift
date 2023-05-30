//
//  ViewD.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewDiet: View {
    var body: some View {
        ZStack{
            Color.gray
            
            Image(systemName: "fork.knife")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewDiet_Previews: PreviewProvider {
    static var previews: some View {
        ViewDiet()
    }
}
