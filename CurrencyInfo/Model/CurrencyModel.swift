//
//  CurrencyModel.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import Foundation

struct CurrencyModel: Codable, Equatable{
    let id : String?
    let name : String?
    let min_size : String?
    
    enum CodingKeys : String, CodingKey{
        case id = "id"
        case name = "name"
        case min_size = "min_size"
    }
}
