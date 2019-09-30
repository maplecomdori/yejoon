//
//  ViewController.swift
//  yejoon
//
//  Created by lee seung hoon on 2019-09-20.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private var data : [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    let testDict : [String : String] = ["주보":"주보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in  0...10 {
            data.append("\(i)")
        }
        tableView.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReuseIdentifier")!
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
}

