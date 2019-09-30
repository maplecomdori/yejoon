//
//  InstructionViewController.swift
//  yejoon
//
//  Created by lewis on 2019-09-30.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var taskNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var taskName = String()

    override func viewWillAppear(_ animated: Bool) {
        taskNameLabel.text = taskName
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
