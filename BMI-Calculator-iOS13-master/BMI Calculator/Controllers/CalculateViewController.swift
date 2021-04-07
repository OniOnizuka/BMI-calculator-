//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //string formating
      let height = String(format: "%.2f", sender.value)
    //interpreted string
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
  let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
        //print(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height,weight:weight)
        /* how to sqaure a number in swift
         to be careful about is that in programming , as with math it follows something called BODMAS which defines the order that calculations are completed.
         first thing that happens are anything thats in a bracket and then anything tha's an exponent or a root and then we have our division or multiplication, and finally our addition or subtraction. so you might have written the as weight divided by heigth */
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // 'as!' means = so by using this "as" keyword , we are effectively performing something called downcasting. At the moment, and the exclamation mark means to force unwrap optionals, this expressses our certainty that when the segue is identified its goTOResult , then the destination view controller that gets created is definitely going to be a ResultViewController.
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

