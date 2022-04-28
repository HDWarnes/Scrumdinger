//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Hamish Warnes on 2022/04/27.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
