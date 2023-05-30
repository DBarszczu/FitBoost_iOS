//
//  ProgressBarFlat.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 30/05/2023.
//

import SwiftUI

struct ProgressBarFlat: View {
    var maxValue: Double
    var currentValue: Double
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.5)
                        .foregroundColor(Color.gray)
                        .cornerRadius(8) // Dodanie zaokrąglonych końcówek

                    Rectangle()
                        .frame(width: self.progressWidth(geometry: geometry), height: 25)
                        .foregroundColor(Color.blue)
                        .cornerRadius(5) // Dodanie zaokrąglonych końcówek
                }
            }
        }
        .frame( height: 10) // Dopasowanie wysokości
        .onAppear {
            self.progress = self.currentValue / self.maxValue
        }
        .onChange(of: currentValue) { newValue in
            withAnimation(.linear(duration: 1.2)) {
                self.progress = newValue / self.maxValue
            }
        }
    }
    
    private func progressWidth(geometry: GeometryProxy) -> CGFloat {
        let width = geometry.size.width
        let progress = CGFloat(self.progress)
        return width * progress
    }
}


struct ProgressBarFlat_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarFlat(maxValue: 3000, currentValue: 1200)
    }
}
