//
//  ViewController.swift
//  BMI calculator
//
//  Created by bashayer Al qaoud on 9/25/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightFeild: UITextField!
    @IBOutlet weak var weightFeild: UITextField!
    @IBOutlet weak var BMIresultLabel: UILabel!
    @IBOutlet weak var statusResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        let weight = Double(weightFeild.text!) ?? 0
        let height = Double(heightFeild.text!) ?? 0
        
        let BMI = calculateBMI(height: height, weight: weight)
        BMIresultLabel.text = "\(BMI)"
        let BMIstatus = status(BMI:BMI)
        statusResultLabel.text = "\(BMIstatus)"
        
    }
    
}

func calculateBMI(height: Double, weight: Double) ->Double {
    return  weight / (height*height)
}


func status(BMI: Double) -> String {
    if BMI < 18.5 {
        return "ضعيف"
    }
    else if BMI <= 30.1 {
        return "وزن طبيعي"
    }
    else if BMI >= 30.1 {
        return "سمنة خفيفة"
    }
    else{
        return "سمنة مفرطة"
    }
}

