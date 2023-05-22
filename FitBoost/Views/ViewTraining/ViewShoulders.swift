//
//  ViewShoulders.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewShoulders: View {
    var body: some View {
        ZStack{
            VStack{
                
                TextTitleBodyPart(TitleBodyPart: "Shoulders")
                    .padding(50.0)
               
                HStack{
                    
                    TextExercise(exercise: "Exercise", imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
                        .padding(.leading, 25.0)
                    Spacer()
                    
                }
                .padding(.vertical)
                
                HStack{
                    
                    TextExercise(exercise: "Exercise",
                                 imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
                    .padding(.leading, 25.0)
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                HStack{
                    TextExercise(exercise: "Exercise", imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
                        .padding(.leading, 25.0)
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                HStack{
                    TextExercise(exercise: "Exercise", imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
                        .padding(.leading, 25.0)
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                HStack{
                    TextExercise(exercise: "Exercise", imageVector: "play.rectangle.fill", youtubeLink: "https://www.youtube.com/watch?v=IcrbM1l_BoI")
                        .padding(.leading, 25.0)
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                
                Spacer()
            }
        }
    }
}

struct ViewShoulders_Previews: PreviewProvider {
    static var previews: some View {
        ViewShoulders()
    }
}
