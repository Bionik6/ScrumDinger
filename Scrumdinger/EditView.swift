//
//  EditView.swift
//  Scrumdinger
//
//  Created by Ibrahima Ciss on 18/09/2021.
//

import SwiftUI

struct EditView: View {
  @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
  @State private var newAttendee = ""
  
    var body: some View {
      List {
        Section(header: Text("Meeting Info")) {
          TextField("Title", text: $scrumData.title)
          HStack {
            Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
              Text("Length")
            }
            .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
            Spacer()
            Text("\(Int(scrumData.lengthInMinutes)) minutes")
              .accessibilityHidden(true)
          }
          ColorPicker("Color", selection: $scrumData.color)
            .accessibilityLabel(Text("Color picker"))
        }
        
        Section(header: Text("Attendees")) {
          ForEach(scrumData.attendees, id: \.self) { attendee in
            Text(attendee)
          }
          .onDelete(perform: { indices in
            scrumData.attendees.remove(atOffsets: indices)
          })
          HStack {
            TextField("New Attendeed", text: $newAttendee)
            Button(action: {
              withAnimation {
                scrumData.attendees.append(newAttendee)
                newAttendee = ""
              }
            }, label: {
              Image(systemName: "plus.circle.fill")
                .accessibilityLabel(Text("Add attendee"))
            })
            .disabled(newAttendee.isEmpty)
          }
        }
      }
      .listStyle(InsetGroupedListStyle())
  
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
