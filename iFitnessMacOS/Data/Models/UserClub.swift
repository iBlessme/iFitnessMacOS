//
//  UserClub.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

struct UserClubs: Codable, Hashable {
    var id: Int
    var name_user, surname, thirdname, passport_number: String
    var passport_serial, snils, phone_number, login: String
    var password, birth_day: String
}

struct PostUserClub: Decodable{
    var id: Int
    var name_user, surname, thirdname, passport_number: String
    var passport_serial, snils, phone_number, login: String
    var password, birth_day: String
    let body: String
}
