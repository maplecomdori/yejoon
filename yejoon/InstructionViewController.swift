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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.image = UIImage(named: "honduras")

    }
    
    var taskName = String()
    var instruction = String()

    override func viewWillAppear(_ animated: Bool) {
        taskNameLabel.text = taskName
        taskDescriptionTextView.text = "Task Description Goes Here"
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
