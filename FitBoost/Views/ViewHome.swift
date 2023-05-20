//
//  ViewA.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewHome: View {
    var body: some View {
        ZStack{
            Color.red
            
            Image(systemName: "house.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewHome_Previews: PreviewProvider {
    static var previews: some View {
        ViewHome()
    }
}
