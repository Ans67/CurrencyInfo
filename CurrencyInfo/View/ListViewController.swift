//
//  ListViewController.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var Listtableview: UITableView!
    
    var arraycurrencyModel = [CurrencyModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI Implementation
        configureUI()
        
        //API Call
        callAPI()
    }
    
    // MARK: - UI Configuration
    func configureUI(){
        self.Listtableview.register(UINib(nibName: "ListViewTableCell", bundle: Bundle.main), forCellReuseIdentifier: "ListViewTableCell")
        
    }
    
    // MARK: - HTTP HEADER
    func headerforwebservice() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type" : "application/json"
        ]
        return headers
    }
    
    
    //MARK: - Get Currency List via API Call
    func callAPI(){
        let url = "https://api.coinbase.com/v2/currencies"
        
        NetworkManger.sharedInstance.sendRequest(for: DataModel.self, url: url, method: .get, headers: headerforwebservice()) { (response) in
            
            switch response{
            
            case .success(let responsedata):
                
               print(responsedata)
                
                self.arraycurrencyModel = responsedata.data ?? []
                DispatchQueue.main.async {
                    self.Listtableview.reloadData()
                }
                
            case .failure(let error):
                
                print(error)
                DispatchQueue.main.async {
                    self.dismiss(animated: false, completion: nil)
                }
            }
            
        }
    }
}



// MARK: - Tableview DataSource and Delegates
extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraycurrencyModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let listviewcell = tableView.dequeueReusableCell(withIdentifier: "ListViewTableCell", for: indexPath) as? ListViewTableCell {
            
            let currencyViewModelObj = CurrencyViewModel(currencymodel: arraycurrencyModel[indexPath.row])
            listviewcell.configure(with: currencyViewModelObj)
            
            return listviewcell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
