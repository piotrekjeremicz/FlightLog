//
//  FlightData.swift
//  
//
//  Created by Jeremicz Piotr on 08/03/2024.
//

import SwiftData
import Foundation

struct Flight {
    let date: Date
    let flightNumber: String
    let from: String
    let to: String
    let depTime: TimeInterval
    let arrTime: TimeInterval
    let duration: String
    let airline: String
    let aircraft: String
    let registration: String
    let seatNumber: String
    let seatType: Int
    let flightClass: Int
    let flightReason: Int
    let note: String
    let depId: Int
    let arrId: Int
    let airlineId: Int
    let aircraftId: Int
}
