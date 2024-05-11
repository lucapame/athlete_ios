//
//  WeightProgressSmallChart.swift
//  athlete.fitness
//
//  Created by Luis Parra on 07/05/24.
//
import Charts
import SwiftUI

struct ExerciseSetData: Hashable {
    let id = UUID()
    let date: Date
    let weight: Double
}

struct Exercise: Hashable {
    let name: String
    let data: [ExerciseSetData]
}

struct WeightLiftingChartView: View {
    let chartData = Exercise(name: "Bicep Curl", data: [
        ExerciseSetData(date: Calendar.current.date(from: .init(year: 2022, month: 07, day: 01))!, weight: 25),
        ExerciseSetData(date: Calendar.current.date(from: .init(year: 2022, month: 07, day: 07))!, weight: 25),
        ExerciseSetData(date: Calendar.current.date(from: .init(year: 2022, month: 07, day: 9))!, weight: 50),
        ExerciseSetData(date: Calendar.current.date(from: .init(year: 2022, month: 07, day: 10))!, weight: 40)
    ])
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 2, content: {
                VStack(alignment: .leading, spacing: 2, content: {
                    Text("22-28 July").font(.subheadline).foregroundStyle(.gray)
                    Text("40Lb").font(.title).fontWeight(.bold)
                })
                Spacer()
                Image(systemName:"arrow.up.circle.fill")
                Text("12% from last week")
            })
            Chart {
                ForEach(chartData.data, id: \.self) { exerciseSet in
                    
                    LineMark(
                        x: .value("Date", exerciseSet.date),
                        y: .value("lb", exerciseSet.weight)
                    ).foregroundStyle(.accent)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                        .interpolationMethod(.catmullRom)
                    AreaMark(
                        x: .value("Date", exerciseSet.date),
                        y: .value("Kg", exerciseSet.weight)
                    ) .interpolationMethod(.catmullRom)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                        .foregroundStyle( LinearGradient(gradient: Gradient(colors: [.accentGreen, .clear]), startPoint: .top, endPoint: .bottom))
                    
                    
                }
                
                
            }
            
        }
    }
}

#Preview {
    ScrollView {
        DetailActivityCard(title:"Workout Minutes", icon:"flame.fill",headerColor: Color.accentGreen,destinationView: HomeView()){
            HStack{
                WeightLiftingChartView()
            }.padding(.vertical)
        }
    }
    
}


