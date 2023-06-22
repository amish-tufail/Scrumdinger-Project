//
//  NewScrumSheet.swift
//  Scrumdinger Project
//
//  Created by Amish on 21/06/2023.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    var body: some View {
        NavigationStack {
            EditDetailView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isPresentingNewScrumView = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        } label: {
                            Text("Done")
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
}
