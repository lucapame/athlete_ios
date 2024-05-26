//
//  MainView.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 22/05/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    @StateObject var hManager = HealthManager.shared
    @State private var isPresenting = true
    
    var body: some View {
        NavigationView{
            HomeView().environmentObject(hManager)
        }
        .fullScreenCover(isPresented: $isPresenting,
                         onDismiss: didDismiss) {
            WorkoutActity()
        }.accentColor(.accentGreen)
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

#Preview {
    MainView().environmentObject(AuthenticationViewModel())
}
