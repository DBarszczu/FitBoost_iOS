//
//  TextExercise.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI
import SafariServices

struct TextExercise: View {
    var exercise: String
    var imageVector: String
    var youtubeLink: String

    @State private var isPresentingYoutube = false
    
    var body: some View {
        HStack{
            Button(action: {
                isPresentingYoutube = true
            }) {
                Image(systemName: imageVector)
                    .font(.system(size: 30))
                    .foregroundColor(.red)
            }
            .sheet(isPresented: $isPresentingYoutube) {
                SafariView(url: URL(string: youtubeLink))
            }
            
            Text(exercise)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

struct TextExercise_Previews: PreviewProvider {
    static var previews: some View {
        TextExercise(exercise: "Exercise", imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL?
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
