//
//  Worker.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

struct Worker: Codable, Hashable {
    var id: Int
    var salary: String
    var position_works_id, user_clubs_id: Int

    var position_work: PositionWork
    var user_club: UserClubs
}

