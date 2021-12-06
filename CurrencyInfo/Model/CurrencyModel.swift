//
//  CurrencyModel.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import Foundation

//{"id":"AED","name":"United Arab Emirates Dirham","min_size":"0.01000000"

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
