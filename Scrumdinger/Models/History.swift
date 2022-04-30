//
//  History.swift
//  Scrumdinger
//
//  Created by Hamish Warnes on 2022/04/29.
//

import Foundation

struct History: Identifiable, Codable{
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int
    
    init(id: UUID = UUID(), date:Date = Date(), attendees: [DailyScrum.Attendee], lenghtInMinutes: Int = 5){
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lenghtInMinutes
    }
}
