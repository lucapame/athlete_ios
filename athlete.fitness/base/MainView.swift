//
//  MainView.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 22/05/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var hManager: HealthManager
    
    
 
    @State private var didStartWorkout = false

    
    
    var body: some View {
        NavigationView{
            HomeView().environmentObject(hManager)
        }
        .onAppear {
                    didStartWorkout = hManager.isActiveSession
                }
        .fullScreenCover(isPresented: $didStartWorkout,
                         onDismiss: didDismiss) {
            WorkoutActity()
        }.accentColor(.accentGreen)
    }
    
    func didDismiss() {
       
    }
}


#Preview {
    let healthManager = HealthManager.shared // Ensure this matches your initialization
    return  MainView().environmentObject(AuthenticationViewModel())
            .environmentObject(healthManager)
  
}
