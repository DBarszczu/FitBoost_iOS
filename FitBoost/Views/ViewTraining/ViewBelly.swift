//
//  ViewBelly.swift
//  FitBoost
//
//  Created by Dominik Barszcz on 20/05/2023.
//

import SwiftUI

struct ViewBelly: View {
    var body: some View {
        ZStack{
            VStack{
                
                TextTitleBodyPart(TitleBodyPart: "Belly")
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

struct ViewBelly_Previews: PreviewProvider {
    static var previews: some View {
        ViewBelly()
    }
}
