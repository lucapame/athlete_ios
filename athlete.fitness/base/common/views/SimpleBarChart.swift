//
//  SimpleBarChart.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//

import SwiftUI
import Charts


struct SimpleWorkoutMinutesBarChart: View {
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, content: {
                Text("Average Minutes").font(.caption2)
                HStack(alignment: .bottom,spacing: 3, content: {
                    Text("53").font(.title).fontWeight(.bold)
                    Text("min").font(.caption).padding(.bottom,4)
                })
            })
            Spacer()
            Chart {
                ForEach(dailySales, id: \.day) {
                    // Try change to LineMark.
                    BarMark(
                        x: .value("Day", $0.day),
                        y: .value("Workout Minutes", $0.minutes)
                    ).foregroundStyle(Color.accentGreen)
                        .cornerRadius(4)
                }
                RuleMark(y: .value("Workout AVG", 53))
                            .foregroundStyle(.orange)
                
            }.chartYAxis(.hidden)
                .frame(maxWidth: 230)
            
        }
        
        }
      
        let dailySales: [(day: String, minutes: Int)] = [
            (day: "M", minutes: 78),
            (day: "T", minutes: 60),
            (day: "W", minutes: 45),
            (day: "T", minutes: 76),
            (day: "F", minutes: 34),
            (day: "S", minutes: 65),
            (day: "S", minutes: 16),
     
        ]
    }

func workout(weekday: Int = 1) -> Date? {
    var components = DateComponents()
    components.weekday = weekday
    
    return Calendar.current.nextDate(after: Date(), matching: components, matchingPolicy: .nextTime)
}

#Preview {
    ScrollView {
        DetailActivityCard(title:"Workout Minutes", icon:"flame.fill",headerColor: Color.accentGreen,destinationView: HomeView()){
            HStack{
                SimpleWorkoutMinutesBarChart()
            }.padding(.vertical)
        }
    }
   
}
