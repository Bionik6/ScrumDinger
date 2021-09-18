//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ibrahima Ciss on 13/09/2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            ScrumsView(scrums: DailyScrum.data)
          }
        }
    }
}
