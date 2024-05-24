//
//  athlete_fitnessApp.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 23/04/24.
//

import SwiftUI
import Firebase

@main
struct athlete_fitnessApp: App {
    @StateObject private var viewModel = AuthenticationViewModel()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(content: {
                MainView()
            })

        
        }
    }
}
