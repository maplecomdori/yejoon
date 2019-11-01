//
//  ViewController.swift
//  yejoon
//
//  Created by lee seung hoon on 2019-09-20.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    private var tasks : [String] = ["팀원 연락처", "아이디 & 비번", "주보 편집", "주보 접는 기계", "성찬식", "선교 헌금", "시간대 별 작업"]

    let sectionOrder : [String] = ["주보", "예배 중", "섹션"]
    let sectionA : [String: [String]] = ["섹션":["테스트"]]
    
//    let sectionTaskList : [[String: [String]]] = [["주보": ["드래프트", "광고", "큐티", "접기", "프린트"]], ["예배 중":["선교 헌금","성찬식"]], ["섹션":["아이디 & 비번"]]]
    
    let sectionTaskDictionary : [String: [String]] = ["주보": ["단축키", "아이디 & 비번", "예배 순서", "큐티", "종이 접는 기계", "프린트", "리뷰 리스트"], "예배":["예배당 셋업", "봉헌" ,"선교 헌금", "성찬식", "자리 안내 요령"]]
    var sectionTitles = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        tableView.delegate = self
        
        sectionTitles = [String](sectionTaskDictionary.keys)
        sectionTitles = sectionTitles.sorted(by: { $0 > $1 })
        
    }
    
     // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return [String](sectionTaskDictionary.keys).count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = sectionTitles[section]
        if let taskValues = sectionTaskDictionary[sectionKey] {
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
//        print("section: \(section)")
        return sectionTitles[section]
    }

    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return sectionTitles
//    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        if segue.identifier == "ShowInstructionSegue", let destination = segue.destination as? InstructionViewController, let section = tableView.indexPathForSelectedRow?.section, let idx = tableView.indexPathForSelectedRow?.row {
//            destination.taskName = tasks[idx]
            let sectionTitle = sectionTitles[section]
            let taskListForSection = sectionTaskDictionary[sectionTitle]
            let task = taskListForSection![idx]
            destination.taskName = task
//            destination.taskName = sectionTaskDictionary[sectionTitles[section]][idx]
            
            destination.instruction = "TEST INSTRUCTION TEST"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("selected")
//        print("section: \(indexPath.section)")
//        print("row: \(indexPath.row)")
        
        let sectionIdx = tableView.indexPathForSelectedRow!.section
        let sectionTitle = sectionTitles[sectionIdx]
        let taskListForSection = sectionTaskDictionary[sectionTitle]
        let task = taskListForSection![indexPath.row]
        print("sectionTitle: \(sectionTitle)")
        print("task: \(task)")
        
        if task == "아이디 & 비번" {
            performSegue(withIdentifier: "ShowCredentialSegue", sender: nil)
        }
        else if task == "큐티" {
            performSegue(withIdentifier: "ShowQtSegue", sender: nil)
        }
        else if task == "예배당 셋업" {
            performSegue(withIdentifier: "ShowSetupSegue", sender: nil)
        }
        else if task == "종이 접는 기계" {
            performSegue(withIdentifier: "ShowFoldingMachineSegue", sender: nil)
        }
        else if task == "프린트" {
            performSegue(withIdentifier: "ShowPrintSegue", sender: nil)
        }
        else if task == "단축키" {
            performSegue(withIdentifier: "ShowShortcutSegue", sender: nil)
        }
        else if task == "예배 순서" {
            performSegue(withIdentifier: "ShowServiceOrderSegue", sender: nil)
        }
        else if task == "리뷰 리스트" {
            performSegue(withIdentifier: "ShowReviewListSegue", sender: nil)
        }
        else if task == "성찬식" {
            performSegue(withIdentifier: "ShowCommunionSegue", sender: nil)
        }


        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

