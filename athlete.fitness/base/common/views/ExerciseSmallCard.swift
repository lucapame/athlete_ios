//
//  ExerciseSmallCard.swift
//  athlete.fitness
//
//  Created by Luis Parra on 06/05/24.
//

import SwiftUI

struct ExerciseSmallCard<Destination: View>: View  {
    let title: String
    let icon: String
    let notes: String
    let type: Unit?
    let duration: Int?
    let destinationView: Destination?
    
    init(title: String, icon: String,type: Unit, duration: Int, notes: String, destinationView: Destination? = nil) {
        self.title = title
        self.icon = icon
        self.type = type
        self.duration = duration
        self.notes = notes
        self.destinationView = destinationView
    }
    
    var body: some View {
        NavigationLink(destination: destinationView){
            HStack(alignment: .center, spacing: 15) {
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Incline alternating press")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        
                        Text("12 Reps" )
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(.gray)
                        
                        Text("25% Lifting Weight")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(.gray)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemGray6))
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(12)
        }
        
        
    }
}

#Preview {
    ScrollView {
        ExerciseSmallCard(title: "Bench Press", icon: "benchpress", type: .reps, duration: 12, notes: "25% Lifting Weight", destinationView:HomeView())
    }
    
}
