//
//  Schools.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import Foundation

/*
 addmission rates
 typical gpa, sat
 link to school website
 */

struct school {
    let name : String
    let addmissionRates : Double
    let typicalGPA : Double
    let typicalSAT : Int
    let typicalACT : Int
    let schoolLink : String
    let tutition : Double
    let city : String
    let state : String
    let male : Double
    let female : Double
    let age : Int
    let firstGeneration : Double
}


// lol

struct SchoolSearchResult: Codable {
    let page: Int?
    let schools: [School]?
}
// MARK: - School
struct School: Codable {
    let academics: [Academic]?
    //let admissions: JSONNull?
    let id: String?
    let schoolID: Int?
    let name: String?
    let schoolURL: String?
    let priceCalculatorURL: String?
    let location: Location?
    let demographics: Demographics?

    enum CodingKeys: String, CodingKey {
        case academics, id
        case schoolID = "school_id"
        case name
        case schoolURL = "school_url"
        case priceCalculatorURL = "price_calculator_url"
        case location, demographics
    }
}

// MARK: - Academic
struct Academic: Codable {
    let name: String?
    let stats: Stats?
}

// MARK: - Stats
struct Stats: Codable {
    let associate, bachelors, degree: Bool?
    let percentage: Double?
}

// MARK: - Demographics
struct Demographics: Codable {
    let femaleShare: Double?
    let ageEntry: Int?
    let firstGeneration, men, women, black: Double?
    let asian, white, aian, hispanic: Double?

    enum CodingKeys: String, CodingKey {
        case femaleShare = "female_share"
        case ageEntry = "age_entry"
        case firstGeneration = "first_generation"
        case men, women, black, asian, white, aian, hispanic
    }
}

// MARK: - Location
struct Location: Codable {
    let city, state, zip: String?
    let lat, lon: Double?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

struct userSearchParametersP {
    let maxSpend : Int
    let commute : Bool
    let outOfState: Bool
    let perferEthnicity : String
    let livingOnCampus : Bool
    let loanPlanned : Bool
    let lookingForScholarships : Bool
    let workPlanned : Bool
    let programLength : Int
}



