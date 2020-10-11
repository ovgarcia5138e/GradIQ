//
//  SchoolCellVIewModel.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import Foundation

struct SchoolCellViewModel {
    var school : school
    
    var name : String {
        return school.name
    }
    
    var city : String {
        return school.city
    }
    
    var state : String {
        return school.state
    }
    
    var tution : Double {
        return school.tutition
    }
    
    var website : String {
        return school.schoolLink
    }
    
    var typcialGPA : Double {
        return school.typicalGPA
    }
    
    var typicalSAT : Int {
        return school.typicalSAT
    }
    
    var typicalACT : Int {
        return school.typicalACT
    }
    
    var addmissonRate : Double {
        return school.addmissionRates
    }
    
    var male : Double {
        return school.male
    }
    
    var female : Double {
        return school.female
    }
    
    var age : Int {
        return school.age
    }
    
    var firstGen : Double {
        return school.firstGeneration
    }
    
    init(currentschool : school) {
        school = currentschool
    }
}
