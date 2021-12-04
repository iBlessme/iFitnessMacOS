//
//  Client.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

struct Client: Codable,Hashable {
    var id: Int
    var abonements_id: Int
    var user_clubs_id: Int
    var abonement: Abonements
    var user_club: UserClubs
}
