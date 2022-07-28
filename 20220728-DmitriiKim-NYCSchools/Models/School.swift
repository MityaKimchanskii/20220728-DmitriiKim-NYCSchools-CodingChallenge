//
//  School.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import Foundation

struct School: Decodable {
    let dbn: String
    let name: String
    let location: String
    let phone: String
    let email: String?
    let website: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case name = "school_name"
        case location = "location"
        case phone = "phone_number"
        case email = "school_email"
        case website = "website"
        case description = "overview_paragraph"
    }
}

struct SchoolSAT: Decodable {
    let dbn: String
    let name: String
    let mathSAT: String
    let readingSAT: String
    let writingSAT: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case name = "school_name"
        case mathSAT = "sat_math_avg_score"
        case readingSAT = "sat_critical_reading_avg_score"
        case writingSAT = "sat_writing_avg_score"
    }
}
