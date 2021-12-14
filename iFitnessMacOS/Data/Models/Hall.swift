//
//  Hall.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 08.12.2021.
//

import Foundation

struct Hall: Codable, Hashable{
    var id: Int
    var name_hall: String
    var capacity: String
    var types_of_tranings_id: Int
    var types_of_traning: TypesOfTraning
}
