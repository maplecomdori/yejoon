//
//  QTViewController.swift
//  yejoon
//
//  Created by lee seung hoon on 2019-10-12.
//  Copyright © 2019 lewislee. All rights reserved.
//

import UIKit

class QTViewController: UIViewController {

    @IBOutlet var instruction: UITextView!
    let qtInstructions : [String] = ["예준팀 폴더에 해당 달(month) 큐티 pdf 파일이 있으면 거기서 참고",
                                     "없으면 duranno.com 으로 가서 pdf file 다운 받기",
                                     "로그인(id: yntoronto, password: dPwnsxla8)",
                                     "\"QT 캘린더\" 클릭",
                                     "PDF 다운 버튼 클릭해서 예준팀 폴더에 다운받기", ""]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        instruction.text = generateQtText()
        
    }
    
    func generateQtText() -> String {
        
        var instruction = ""
        
        for i in 0...qtInstructions.count-1 {
            instruction = instruction + "\(i+1). " + qtInstructions[i] + "\n\n"
        }
        return instruction
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
