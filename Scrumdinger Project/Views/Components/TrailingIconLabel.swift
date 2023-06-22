//
//  TrailingIconLabel.swift
//  Scrumdinger Project
//
//  Created by Amish on 20/06/2023.
//

import SwiftUI

struct TrailingIconLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabel {
    static var trailingIcon: Self { Self() }
}
