//
//  HealthManager.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 22/05/24.
//

struct Activity {
    var id: Int
    var title: String
    var value: String
    var unit: String
    var icon: String
}

import Foundation
import HealthKit

class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var activites: [String : Activity] = [:]
    
    init() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let workoutMinutes = HKQuantityType(.appleExerciseTime)
        let healthTypes: Set = [calories,workoutMinutes]
        
        Task {
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            }catch{
                print ("Error getting acsess")
            }
        }
    }
    
    
 
    func fetchTodayActiveCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                print("Error getting active calories")
                return
            }
            let value = sum.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, title: "Calories", value: value.format(f: ".0"), unit: "kcal", icon: "flame.fill")

           DispatchQueue.main.async {
                self.activites["activeCalories"] = activity
            }
            print("Active calories: \(value)")
        }
        
        healthStore.execute(query)
    }

    func fetchTodayWorkoutMinutes() {
        let workoutMinutes = HKQuantityType(.appleExerciseTime)
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: workoutMinutes, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                print("Error getting workout minutes")
                return
            }
            let value = sum.doubleValue(for: .minute())
            let activity = Activity(id: 2, title: "Workout", value: value.format(f: ".0"), unit: "min", icon: "figure.run")
            
            DispatchQueue.main.async {
                self.activites["workoutMinutes"] = activity
            }
            print("Workout minutes: \(value)")
        }
        
        healthStore.execute(query)
    }

    func fetchTodaySummary() {
        fetchTodayActiveCalories()
        fetchTodayWorkoutMinutes()
    }
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
