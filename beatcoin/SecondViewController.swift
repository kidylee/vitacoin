//
//  SecondViewController.swift
//  beatcoin
//
//  Created by An Li on 3/15/18.
//  Copyright © 2018 An Li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var data = [["price":"$2.4", "time":"1 minute ago"],
                ["price":"$1.37", "time":"3 minutes ago"],
                ["price":"$0.11", "time":"7 minutes ago"],
                ["price":"$3.43", "time":"8 minutes ago"],
                ["price":"$0.89", "time":"half hour ago"],
                ["price":"$0.27", "time":"1 hour ago"],
                ["price":"$0.57", "time":"1 hour ago"],
                ["price":"$0.21", "time":"2 hours ago"],
                ["price":"$0.28", "time":"2 hours ago"],
                ["price":"$1.40", "time":"4 hours ago"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionTableViewCell
        
        let d = data[indexPath.row]
        cell.price.text = d["price"]
        cell.time.text = d["time"]
        
        
        return cell
    }
    
    
}
