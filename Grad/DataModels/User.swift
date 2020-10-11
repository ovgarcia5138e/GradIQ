//
//  User.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import Foundation

struct User : Decodable {
    let id : String
    let firstName : String
    let lastName : String
    let ethnicity : String?
    let email : String
    let gpa : Double?
    let mostEducation : String
}

struct registrationResponse : Decodable {
    let token : String
    let user : User
}

struct currentUser {
    static var currUser : registrationResponse?
}

struct userCredentials {
    let email : String
    let password : String
    let firstName : String
    let lastname : String
    let satScore : Int
    let gpa : Double
    let ethnicity : String
    let gender : String
    let mostEducation : String
    let Interests : [String]
}

//struct userSearchParameters {
//    let maxSpend : Int
//    let commute : Bool
//    let outOfState: Bool
//    let perferEthnicity : Bool
//    let livingOnCampus : Bool
//    let loanPlanned : Bool
//    let lookingForScholarships : Bool
//    let workPlanned : Bool
//    let programLength : Int
//}

