//
//  ScrumDetailView.swift
//  Scrumdinger Project
//
//  Created by Amish on 20/06/2023.
//

import SwiftUI

struct ScrumDetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var body: some View {
        List {
            Section {
                NavigationLink {
                    MeetingView(scrum: $scrum)
                } label: {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4.0)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))
                }
                .accessibilityElement(children: .combine)
            } header: {
                Text("Meeting Info")
            }
            Section {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            } header: {
                Text("Attendes")
            }
            Section {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            } header: {
                Text("History")
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            ToolbarItem {
                Button {
                    isPresentingEditView = true
                    editingScrum = scrum
                } label: {
                    Text("Edit")
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                EditDetailView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button {
                                isPresentingEditView = false
                            } label: {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button {
                                isPresentingEditView = false
                                scrum = editingScrum
                            } label: {
                                Text("Done")
                            }
                        }
                    }
            }
        })
    }
}

#Preview {
    NavigationStack {
        ScrumDetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
