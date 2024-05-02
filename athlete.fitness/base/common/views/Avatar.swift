//
//  Avatar.swift
//  athlete.fitness
//
//  Created by Luis Parra on 28/04/24.
//

import SwiftUI


struct AvatarView: View {
    var userName: String?
    var size: CGFloat = 35
  
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if let initials = userName {
                Text(extractInitials(from: initials).uppercased())
                    .font(.system(size: size * 0.4)) // Adjust the multiplier as needed
            } else {
                Image(systemName: "person")
                    .font(.system(size: size * 0.4)) // Adjust the multiplier as needed
                    
            }
        }
        .padding(0)
        .frame(width: size, height: size, alignment: .center)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(51)
    }
    
    func extractInitials(from input: String) -> String {
        let names = input.split(separator: " ")
        let initials = names.prefix(2).map { String($0.first ?? Character("")) }
        return initials.joined()
    }
}



#Preview {
    AvatarView(userName:"luis parra")
}
