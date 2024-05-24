//
//  MainView.swift
//  athlete.fitness
//
//  Created by LUIS PARRA on 22/05/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    @StateObject var hManager = HealthManager()
    
    var body: some View {
        NavigationView{
            HomeView().environmentObject(HealthManager())
        }.accentColor(.accentGreen)
    }
}

#Preview {
    MainView().environmentObject(AuthenticationViewModel())
}
