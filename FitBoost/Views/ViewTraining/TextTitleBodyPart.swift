//
//  TextTitleBodyParts.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct TextTitleBodyPart: View {
    
    var TitleBodyPart: String
    
    var body: some View {
        Text(TitleBodyPart)
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
}

struct TextTitleBodyPart_Previews: PreviewProvider {
    static var previews: some View {
        TextTitleBodyPart(TitleBodyPart: "CHEST")
    }
}
