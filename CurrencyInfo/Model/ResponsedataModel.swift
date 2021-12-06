//
//  ResponsedataModel.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import Foundation

struct DataModel : Codable , Equatable{
    let error : Bool?
    let status : String?
    let data : [CurrencyModel]?

    enum CodingKeys: String, CodingKey {

        case error = "error"
        case status = "status"
        case data = "data"
    }
}
