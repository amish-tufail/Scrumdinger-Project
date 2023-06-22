//
//  ThemeView.swift
//  Scrumdinger Project
//
//  Created by Amish on 21/06/2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4.0)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
