//
//  ProfileItem.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 26/05/2023.
//

import SwiftUI

struct ProfileItem: View {
    
    var profileText: String
    var profileImage: String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: profileImage)
                .font(.system(size: 30))
                .foregroundColor(.blue)
            
            
            Text(profileText)
                .font(.title)
                .fontWeight(.semibold)
            
        }
        .padding(.vertical, 10.0)
    }
}

struct ProfileItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItem(profileText: "Personal date", profileImage: "person.fill")
    }
}
