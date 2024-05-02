//
//  SettignsView.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//

import SwiftUI

struct SettignsView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @State var presentingConfirmationDialog = false
    
    private func signOut() {
        viewModel.signOut()
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    NavigationLink(destination: HomeView()) {
                        AvatarView(userName: "Luis Parra", size: 60)
                        VStack(alignment: .leading, content: {
                            Text("Luis Carlos").font(.title2)
                            Text("Account, Personal info Settings")
                                .font(.footnote)
                                .foregroundStyle(.gray.opacity(70))
                        })
                        
                    }
                    
                }
                Section() {
                    NavigationLink(destination: HomeView()) {
                        Text("Body Measures")
                    }
                    NavigationLink(destination: HomeView()) {
                        Text("Workouts")
                    }
                    NavigationLink(destination: HomeView()) {
                        Text("Membership")
                    }
                    NavigationLink(destination: HomeView()) {
                        Text("App Settings")
                    }
                }
                
                Section {
                    Button(role: .cancel, action: signOut) {
                        HStack {
                            Spacer()
                            Text("Sign out")
                            Spacer()
                        }
                    }
                }
            }
        }.accentColor(.accentGreen)
    }
}

#Preview {
    SettignsView()
}
