//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    
    var leftOddDiceNumber = 0
    var rightOddDiceNumber = 2
    
    var leftEvenDiceNumber = 0
    var rightEvenDiceNumber = 2
    
    var buttonPressCount = 0 // have to set a variable because the number will change
    /* to animate code
     animationImage = dice#
     animationDuration = 2.0
     animationRepeatCount =4
     
     diceImageView.startAnimating()
     */

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        buttonPressCount += 1// counts the times the buttonn was pressed
        //print("leftDiceNumber at beginning = \(leftDiceNumber)")
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix"),]
        
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        
        //this is to make a quick animation that's activated when you hit the button
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in //the line below has the time duration of the animation while also having code for the button to "bounce" when touched
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                sender.transform = .identity
            }, completion: nil) //this line is essentially a return function
        }
        //call the animation function
        startDiceAnimation()

        //var leftDiceNumber wouldn't work because it would run and add 1 making it equal to leftDiceNumber to 2 and stay there
        //leftDiceNumber += 1
        //rightDiceNumber -= 1
        
        //leftdiceNumber=2
        //use print as a way to see the problems print(leftDiceNumber)
        //print("leftDiceNumber at end = \(leftDiceNumber)")

    }
    


    
    @IBAction func oddRollButtonPressed(_ sender: UIButton) {
        buttonPressCount += 1
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFive")][Int.random(in: 0...2)]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFive")][Int.random(in: 0...2)]
        
        startDiceAnimation()
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                sender.transform = .identity
            }, completion: nil)
        }

    }
    
    
    
    @IBAction func evenRollButtonPressed(_ sender: UIButton) {
        buttonPressCount += 1
        diceImageView1.image = [#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix")][Int.random(in: 0...2)]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceSix")][Int.random(in: 0...2)]
        startDiceAnimation()
       /* leftEvenDiceNumber = leftEvenDiceNumber + 1
        rightEvenDiceNumber = rightEvenDiceNumber + 1
        
        if leftEvenDiceNumber >= 3 {
                leftEvenDiceNumber = 0
            }
            
            if rightEvenDiceNumber >= 3 {
                rightEvenDiceNumber = 0
            }
        */
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    func startDiceAnimation() {
        let animationArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix"),]
        
        //dice will appear moving on the screen for only the even adn odd button
        diceImageView1.animationImages = animationArray
        diceImageView1.animationDuration = 1.5
        diceImageView1.animationRepeatCount = -1
        diceImageView1.startAnimating()
        
        diceImageView2.animationImages = animationArray
        diceImageView2.animationDuration = 1.5
        diceImageView2.animationRepeatCount = -1
        diceImageView2.startAnimating()
            
        // Stop the animation after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.diceImageView1.stopAnimating()
            self.diceImageView2.stopAnimating()
        }

        }
    
    @IBAction func recapButtonPressed(_ sender: UIButton) {
        
        messageLabel.text = "You've played this game \(buttonPressCount) times!"
    }
    
    
                                    
    
    /*func addBounceAnimation(to imageView: UIImageView) {
            let origin = imageView.center
            let target = CGPoint(x: imageView.center.x, y: imageView.center.y - 100)
            let bounce = CABasicAnimation(keyPath: "position.y")
            bounce.duration = 0.5
            bounce.fromValue = origin.y
            bounce.toValue = target.y
            bounce.repeatCount = 2
            bounce.autoreverses = true
            imageView.layer.add(bounce, forKey: "position")
        }
    */
    
}

