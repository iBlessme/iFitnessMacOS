//
//  Education.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 07.12.2021.
//

import Foundation

struct Education: Hashable, Codable{
    var id: Int
    var quailifaction: String
    var stage: String
    var registration_number: String
    var serial_number: String
    var institution: String
    var date_ofissue: String
    var workers_id: Int
    var worker: Worker
}
