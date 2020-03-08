//
//  ViewController.swift
//  BMIcalc
//
//  Created by 水越侑哉也 on 2020/03/08.
//  Copyright © 2020 yukiboard. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmiText: UILabel!
    @IBOutlet weak var heightErrorMsg: UILabel!
    @IBOutlet weak var weightErrorMsg: UILabel!
    
    final class messageConst{
        static let heightEmptyError = "身長が入力されていません。"
        static let weightEmptyError = "体重が入力されていません。"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.height.keyboardType = UIKeyboardType.decimalPad
        self.weight.keyboardType = UIKeyboardType.decimalPad
    }
    
    
    @IBAction func button(_ sender: Any) {
        heightErrorMsg.text=""
        weightErrorMsg.text=""
        bmiText.text=""
        
        if(validation()){
            return
        }
        
        var dheight = Double(height.text!)
        let dweight = Double(weight.text!)
        dheight = dheight! / 100
        dheight = dheight! * dheight!
        let bmi = String(dweight! / dheight!)
        bmiText.text = ("あなたのBMIは" + bmi + "です")
    }
    
    private func validation() -> Bool{
        var result: Bool = false
        if(height.text==""){
            heightErrorMsg.text=messageConst.heightEmptyError
            result=true
        }
        if(weight.text==""){
            weightErrorMsg.text=messageConst.weightEmptyError
            result=true
        }
        return result
    }
    
}
