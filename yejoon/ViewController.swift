//
//  ViewController.swift
//  yejoon
//
//  Created by lee seung hoon on 2019-09-20.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private var tasks : [String] = ["팀원 연락처", "아이디 & 비번", "주보 편집", "주보 접는 기계", "성찬식", "선교 헌금", "시간대 별 작업"]

    let sections : [String] = ["예배 전", "예배 중", "예배 후"]
//    var taskDictionary = [String: [String]]()
    
    let sectionTaskDictionary : [String: [String]] = ["주보": ["드래프트", "접기"], "예배 중":["선교 헌금","성찬식"]]
    var sectionTitles = [String]()
    
    let instructionSegueIdentifier = "ShowInstructionSegue"
    @IBOutlet weak var tableView: UITableView!
    
    let testDict : [String : String] = ["주보":"주보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in  0...10 {
//            data.append("\(i)")
//        }
        
        tableView.dataSource = self
        
        sectionTitles = [String](sectionTaskDictionary.keys)
        print(sectionTitles)
        
    }
    
     // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return [String](sectionTaskDictionary.keys).count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = sectionTitles[section]
        if let taskValues = sectionTaskDictionary[sectionKey] {
            print(taskValues.count)
            return taskValues.count
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReuseIdentifier")!
        
//        let text = tasks[indexPath.row]
//
//        cell.textLabel?.text = text

        let sectionKey = sectionTitles[indexPath.section]
        if let taskValues = sectionTaskDictionary[sectionKey] {
            cell.textLabel?.text = taskValues[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == instructionSegueIdentifier, let destination = segue.destination as? InstructionViewController, let section = tableView.indexPathForSelectedRow?.section, let idx = tableView.indexPathForSelectedRow?.row {
//            destination.taskName = tasks[idx]
            let sectionTitle = sectionTitles[section]
            let sectionValues = sectionTaskDictionary[sectionTitle]
            let task = sectionValues![idx]
            destination.taskName = task
//            destination.taskName = sectionTaskDictionary[sectionTitles[section]][idx]
            
            destination.instruction = "TEST INSTRUCTION TEST"
            
        }
    }
}

