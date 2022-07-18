//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    let listDice: [UIImage] = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
//    var leftDiceNumber: Int = 0
//    var rigthDiceNumber: Int = 5
    
    
    @IBAction func rollButtonPressed() {
        diceImageViewOne.image = listDice.randomElement()
        diceImageViewTwo.image = listDice.randomElement()
        
        //        diceImageViewOne.image = listDice[leftDiceNumber]
        //        diceImageViewTwo.image = listDice[rigthDiceNumber]
        //
        //        rigthDiceNumber -= 1
        //        leftDiceNumber += 1
    }
    
}
