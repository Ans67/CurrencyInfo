//
//  ListViewTableCell.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import UIKit

class ListViewTableCell: UITableViewCell {

    @IBOutlet weak var lblCurrencyname: UILabel!
    @IBOutlet weak var lblCurrencyCode: UILabel!
    
    private(set) var currencyViewModel: CurrencyViewModel!
    
    func configure(with viewmodel: CurrencyViewModel) {
        self.currencyViewModel = viewmodel
        configureUI()
    }
    
    private func configureUI() {
        lblCurrencyname.text = currencyViewModel.currencyName
        lblCurrencyCode.text = currencyViewModel.currencyCode
    }
    
}
