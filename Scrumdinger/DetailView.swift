//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ibrahima Ciss on 18/09/2021.
//

import SwiftUI

struct DetailView: View {
  let scrum: DailyScrum
  @State private var isPresented = false
  
    var body: some View {
      List {
        Section(header: Text("Meeting Info")) {
          NavigationLink(destination: MeetingView()) {
              Label("Start Meeting", systemImage: "timer")
                .font(.headline)
                .foregroundColor(.accentColor)
                .accessibilityLabel(Text("Start meeting"))
            }
          HStack {
            Label("Length", systemImage: "clock")
              .accessibilityLabel(Text("Meeting length"))
            Spacer()
            Text("\(scrum.lengthInMinutes) minutes")
          }
          HStack {
            Label("Color", systemImage: "paintpalette")
            Spacer()
            Image(systemName: "checkmark.circle.fill")
              .foregroundColor(scrum.color)
          }
          .accessibilityElement(children: .ignore)
        }
        
        Section(header: Text("Attendees")) {
          ForEach(scrum.attendees, id: \.self) { attendee in
            Label(attendee, systemImage: "person")
              .accessibilityLabel(Text("Person"))
              .accessibilityValue(Text(attendee))
          }
          
        }
      }
      .listStyle(InsetGroupedListStyle())
      .navigationBarItems(
        leading: Button("Cancel") { isPresented = false },
        trailing: Button("Done") { isPresented = false }
      )
      .navigationTitle(scrum.title)
      .fullScreenCover(isPresented: $isPresented) {
        NavigationView { EditView().navigationTitle(scrum.title) }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        DetailView(scrum: DailyScrum.data[0])
      }
    }
}
