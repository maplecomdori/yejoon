//
//  ViewController.swift
//  yejoon
//
//  Created by lee seung hoon on 2019-09-20.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private var data : [String] = ["팀원 연락처", "아이디 & 비번", "주보 편집", "주보 접는 기계", "성찬식", "선교 헌금", "시간대 별 작업"]

    let sections : [String] = ["예배 전", "예배 중", "예배 후"]
    let instructionSegueIdentifier = "ShowInstructionSegue"
    @IBOutlet weak var tableView: UITableView!
    
    let testDict : [String : String] = ["주보":"주보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in  0...10 {
//            data.append("\(i)")
//        }
        
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == instructionSegueIdentifier, let destination = segue.destination as? InstructionViewController, let idx = tableView.indexPathForSelectedRow?.row {
            destination.taskName = data[idx]
        }
    }
}

