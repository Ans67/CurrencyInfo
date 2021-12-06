//
//  ListViewController.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var Listtableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //method calls
        configureUI()
    }
    
    // MARK: - UI Configuration
    func configureUI(){
        
        
    }
    
    // MARK: - HTTP HEADER
    func headerforwebservice() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        return headers
    }
    
    
    //MARK: - Get Currency List via API Call
    func callApi(){
        let url = "https://api.coinbase.com/v2/currencies"
        
        NetworkManger.sharedInstance.sendRequest(for: CurrencyModel.self, url: url, method: .post, headers: headerforwebservice()) { (response) in
            
            switch response{
            
            case .success(let responsedata):
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
    
    
}
