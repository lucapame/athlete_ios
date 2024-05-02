//
//  CustomLabel.swift
//  athlete.fitness
//
//  Created by Luis Parra on 29/04/24.
//

import SwiftUI

struct InvertedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 8) {
            configuration.title
            configuration.icon
        }
    }
}
