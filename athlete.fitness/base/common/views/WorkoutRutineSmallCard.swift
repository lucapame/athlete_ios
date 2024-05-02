//
//  WorkoutRutineSmallCard.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//

import SwiftUI

struct WorkoutRutineSmallCard: View {
    
    var body: some View {
        VStack(alignment: .leading,spacing: 3, content: {
            HStack(alignment: .top,content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    Text("All for arms").font(.title3).fontWeight(.bold)
                    
                    HStack(spacing: 3, content: {
                        Image(systemName: "figure.strengthtraining.traditional").foregroundColor(.gray)
                        Text("Traditional Strength Workout - Arms").foregroundColor(.gray)
                    })
                    
                    HStack(spacing: 3, content: {
                        Image(systemName: "clock.arrow.circlepath").foregroundColor(.orange).fontWeight(.bold).font(.callout)
                        Text("35 MIN").fontWeight(.bold).font(.callout).foregroundColor(.orange)
                    })
                    Text("yesterday").foregroundColor(.gray).font(.footnote)
                    Spacer()
                })
                Spacer()
                
            })
        })
    }
}

#Preview {
    ScrollView {
        WorkoutRutineSmallCard()
    }.padding()
}
