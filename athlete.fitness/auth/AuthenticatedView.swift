//
//  AuthenticatedView.swift
//  athlete.fitness
//
//  Created by Luis Parra on 26/04/24.
//

import SwiftUI

extension AuthenticatedView where Unauthenticated == EmptyView {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = nil
        self.content = content
    }
}

struct AuthenticatedView<Content, Unauthenticated>: View where Content: View, Unauthenticated: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var presentingLoginScreen = false
    @State private var presentingProfileScreen = false
    
    var unauthenticated: Unauthenticated?
    @ViewBuilder var content: () -> Content
    
    public init(unauthenticated: Unauthenticated?, @ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = unauthenticated
        self.content = content
    }
    
    public init(@ViewBuilder unauthenticated: @escaping () -> Unauthenticated, @ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = unauthenticated()
        self.content = content
    }
    
    
    var body: some View {
        switch viewModel.authenticationState {
        case .unauthenticated, .authenticating:
            VStack {
                if let unauthenticated {
                    unauthenticated
                }
                
                Text("Build better habits, build a better you.")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    
                    .kerning(0.35)
                    .foregroundColor(.white)
                    .frame(width: 300, alignment: .topLeading)
                
                Spacer()
                Button("Sign In") {
                    viewModel.reset()
                    presentingLoginScreen.toggle()
                }.padding(.horizontal, 25)
                    .padding(.vertical, 15)
                    .background(.accentGreen)
                    .cornerRadius(34)
                    .foregroundColor(.black)
                    .font(.headline)
                
                Text("If you don't have an acocunt contact your administrator.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .frame(width: 294, alignment: .top)
                    .padding(.top,40)
            }
            .padding(.vertical, 100)
            .frame(minWidth: 500)
            .background(.black.opacity(0.10))
            .background(
                Image("bg_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            )
            .ignoresSafeArea()
            .sheet(isPresented: $presentingLoginScreen) {
                AuthenticationView()
                    .environmentObject(viewModel)
            }
        case .authenticated:
            HomeView().environmentObject(viewModel)
          
        }
    }
}


#Preview {
    AuthenticatedView {
        Text("You're signed in.")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(.yellow)
    }
}
