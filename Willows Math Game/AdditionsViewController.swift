//
//  AdditionsViewController.swift
//  Willows Math Game
//
//  Created by WATG  on 10/3/15.
//  Copyright © 2015 WATG . All rights reserved.
//

import UIKit

class AdditionsViewController: UIViewController,UITextFieldDelegate {
     
     @IBOutlet var additionElementTwo: UILabel!
     @IBOutlet var additionElementOne: UILabel!
     @IBOutlet var resultTextField: UITextField!
     
     @IBOutlet weak var levelDesc: UILabel!
     
     var numberOne = 0
     var numberTwo = 0
     var totalNumberOfCorrectAdditions = 0
     var difficultyLevel = 1
     
     
     @IBAction func btnCheckResult(sender: AnyObject) {
          
          let userInput = Int(resultTextField.text!)!
          
          if(numberOne + numberTwo == userInput){
               print("Good")
               initialize()
          }
          else{
               print("Incorrect")
          }
          
     }
     
     func updateStatistics(){
          
          totalNumberOfCorrectAdditions++
          NSUserDefaults.standardUserDefaults().setObject(totalNumberOfCorrectAdditions, forKey: "totalNumberOfCorrectAdditions")
          
          print("Total Number of correct additions " + String(totalNumberOfCorrectAdditions))
          if(totalNumberOfCorrectAdditions >= 10 && totalNumberOfCorrectAdditions < 20){
               difficultyLevel=2
          }
          else if(totalNumberOfCorrectAdditions >= 20 && totalNumberOfCorrectAdditions < 30){
               difficultyLevel=3
          }
          else if(totalNumberOfCorrectAdditions >= 30 && totalNumberOfCorrectAdditions < 40){
               difficultyLevel=4
          }

     }
     
     func initialize(){
          
          updateStatistics()
          
          let maxNumber = UInt32(difficultyLevel*10)
          numberOne = Int(arc4random_uniform(maxNumber))
          numberTwo = Int(arc4random_uniform(maxNumber))
          
          additionElementOne.text = String(numberOne)
          additionElementTwo.text = String(numberTwo)
          resultTextField.text = ""
          
          
          levelDesc.text = "Level " + String(difficultyLevel)
          
          
     }
     
     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
          self.view.endEditing(true)
     }
     
     func textFieldShouldReturn(textField: UITextField) -> Bool{
          
          resultTextField.resignFirstResponder()
          return true
          
     }
     
     override func viewDidLoad() {
          
          super.viewDidLoad()
          
          if let temp =  NSUserDefaults.standardUserDefaults().objectForKey("totalNumberOfCorrectAdditions") as? Int{
               totalNumberOfCorrectAdditions=temp
          }
          
          initialize()
          
     }
     
     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }
     
     
     /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
     
}
