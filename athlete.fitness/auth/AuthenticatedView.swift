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
                VStack{
                    
                    HStack{
                        Image("msf_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 110)
                            .padding()
                            .padding(.top)
                            .environment(\.colorScheme, .dark)
                        Spacer()
                    }
                    .safeAreaPadding(.top)
                    
                    Text("Build better **habits**, build a better **you**.")
                                            .font(.system(size: 60))
                                            .opacity(0.3)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                            .padding(.horizontal)
                      
                    
                    Spacer()

                    HStack{
                        Button(action: {
                            viewModel.reset()
                            presentingLoginScreen.toggle()
                        }) {
                            Label("Sign In", systemImage: "figure.run")
                                .font(.title3)
                                .labelStyle(.titleOnly)
                                .padding(8)
                                .frame(width: 280)
                            
                        }.buttonStyle(.borderedProminent)
                            .tint(.accentGreen)
                            .foregroundColor(.black)
                            .controlSize(.regular)
                            .cornerRadius(12)

                    }
                    
                    Text("If you don't have an acocunt contact your administrator.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(width: 294, alignment: .top)
                        .padding(.top,40)
                    
                }
                .safeAreaPadding(.top)
                .padding(.bottom,30)
             
            }
           
           
            .background(.black.opacity(0.10))
            .background(
                Image("bg_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            )
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
            .sheet(isPresented: $presentingLoginScreen) {
                AuthenticationView()
                    .environmentObject(viewModel)
            }.accentColor(.accentGreen)
        case .authenticated:
          
            content().environmentObject(viewModel)
         
          
        }
    }
}


#Preview {
    AuthenticatedView {
        Text("You're signed in.")
    }
}
