//
//  buttonBanner.swift
//  Charlotte Connect
//
//  Created by Deeraj Anandraj on 9/18/24.
//

import Foundation



class buttonBanner: Hashable {
    var eventName: String
    var eventDescription: String
    var eventDate: Date
    var eventLocation: String
    
    
    
    init(eventName: String, eventDescription: String, eventDate: Date, eventLocation: String) {
        self.eventName = eventName
        self.eventDescription = eventDescription
        self.eventDate = eventDate
        self.eventLocation = eventLocation
    }
    
    
    func getEventName() -> String {
        return eventName
    }
    
    func getEventDescription() -> String {
        return eventDescription
    }
    
    func getEventDate() -> Date {
        return eventDate
    }
    
    func getEventLocation() -> String {
        return eventLocation
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(eventName)
        hasher.combine(eventDescription)
        hasher.combine(eventDate)
        hasher.combine(eventLocation)
    }
        
    static func == (lhs: buttonBanner, rhs: buttonBanner) -> Bool {
        return lhs.eventName == rhs.eventName &&
        lhs.eventDescription == rhs.eventDescription &&
        lhs.eventDate == rhs.eventDate &&
        lhs.eventLocation == rhs.eventLocation
    }
    
}
