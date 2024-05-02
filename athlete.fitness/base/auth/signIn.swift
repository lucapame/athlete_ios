//
//  signIn.swift
//  athlete.fitness
//
//  Created by Luis Parra on 26/04/24.
//


import SwiftUI
import Combine

private enum FocusableField: Hashable {
    case email
    case password
}

struct SignIn: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @State var isLoading = false
    
    @FocusState private var focus: FocusableField?
    
    private func signInWithEmailPassword() {
        isLoading = true
        Task {
            if await viewModel.signInWithEmailPassword() == true {
                isLoading = false
                dismiss()
            }
        }
    }
    
    var body: some View {
        VStack {
            Image("logo_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .padding(.top,35)
            
            Text("Log in so you can access your account.")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            HStack {
                TextField("Email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .focused($focus, equals: .email)
                    .submitLabel(.next)
                    .padding(.all,12)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .onSubmit {
                        self.focus = .password
                    }
            }
            .padding(.vertical, 6)
            .padding(.bottom, 4)
            .padding(.top, 20)
            
            HStack {
                SecureField("Password", text: $viewModel.password)
                    .focused($focus, equals: .password)
                    .submitLabel(.go)
                    .padding(.all,12)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .onSubmit {
                        signInWithEmailPassword()
                    }
            }
            .padding(.vertical, 6)
            .padding(.bottom, 8)
            
            if !viewModel.errorMessage.isEmpty {
                VStack {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color(UIColor.systemRed))
                }
            }
            
            Button(action: signInWithEmailPassword) {
                if viewModel.authenticationState != .authenticating {
                    
                    Text("Entrar")
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                }
                else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                }
            }
            .foregroundColor(.black)
            .disabled(!viewModel.isValid)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .listStyle(.plain)
        .padding()
        .accentColor(.accentGreen)
    }
}


#Preview {
    Group {
        SignIn()
    }
    .environmentObject(AuthenticationViewModel())
}
