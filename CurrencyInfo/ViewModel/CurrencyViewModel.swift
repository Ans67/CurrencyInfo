//
//  CurrencyViewModel.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import Foundation

struct CurrencyViewModel {
    
    private var currencymodel :CurrencyModel!
    
    init(currencymodel:CurrencyModel){
        self.currencymodel = currencymodel
    }
    
    var currencyName :String {return currencymodel.name ?? ""}
    var currencyCode :String {return currencymodel.id ?? ""}
    
}
