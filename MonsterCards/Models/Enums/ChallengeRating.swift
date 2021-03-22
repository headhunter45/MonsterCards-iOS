//
//  ChallengeRating.swift
//  MonsterCards
//
//  Created by Tom Hicks on 3/21/21.
//

import Foundation

enum ChallengeRating: String, CaseIterable, Identifiable {
    case zero = "0"
    case oneEighth = "1/8"
    case oneQuarter = "1/4"
    case oneHalf = "1/2"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case eleven = "11"
    case twelve = "12"
    case thirteen = "13"
    case fourteen = "14"
    case fifteen = "15"
    case sixteen = "16"
    case seventeen = "17"
    case eighteen = "18"
    case nineteen = "19"
    case twenty = "20"
    case twentyOne = "21"
    case twentyTwo = "22"
    case twentyThree = "23"
    case twentyFour = "24"
    case twentyFive = "25"
    case twentySix = "26"
    case twentySeven = "27"
    case twentyEight = "28"
    case twentyNine = "29"
    case thirty = "30"
    case custom = "*"
        
    var id: ChallengeRating { self }
    
    // Probably don't need this
    var displayName: String {
        return rawValue
    }
}
