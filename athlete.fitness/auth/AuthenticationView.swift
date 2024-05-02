//
//  AuthenticationView.swift
//  athlete.fitness
//
//  Created by Luis Parra on 26/04/24.
//

import SwiftUI
import Combine

struct AuthenticationView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            switch viewModel.flow {
            case .login:
                SignIn()
                    .environmentObject(viewModel)
            case .signUp:
                SignIn()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(AuthenticationViewModel())
}
