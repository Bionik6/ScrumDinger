//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Ibrahima Ciss on 13/09/2021.
//

import SwiftUI

struct ScrumsView: View {
  var scrums: [DailyScrum]
  
    var body: some View {
      List {
        ForEach(scrums, id: \.title) { scrum in
          NavigationLink(destination: Text("Hello World")) {
            CardView(scrum: scrum)
          }.listRowBackground(scrum.color)
        }
      }
      .navigationTitle("Daily Scrums")
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing, content: {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "plus")
          })
        })
      })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
      ScrumsView(scrums: DailyScrum.data)
    }
}
