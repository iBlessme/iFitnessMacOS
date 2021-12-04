//
//  Abonement.swift
//  iFitnessMacOS
//
//  Created by iBlessme on 04.12.2021.
//

import Foundation

struct Abonements: Hashable, Codable{
    public var id: Int
   public var name_abonement, cost_abonement, date_start, date_finish: String
   public var bonus_programms_id: Int
    
}
