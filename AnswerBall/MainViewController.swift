//
//  MainViewController.swift
//  AnswerBall
//
//  Created by Robert Rock on 12/12/15.
//  Copyright © 2015 Robert Rock. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var fortuneLabel: UILabel!

    var model : StrainModel = StrainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fortuneLabel.text = "Strain"
        
    }

    
    // MARK: Actions
    
    @IBAction func fortuneButtonTap(sender: AnyObject) {
    
        // Get random # from array.count
        let random = Int(arc4random_uniform(UInt32(model.strains.count)))
        
        // Display answer
        fortuneLabel.text = model.strains[random]
        
        // Play sound
        do {
            try model.playSound("shakesound", fileExtension: "wav")
        } catch {
            return
        }
        
    } // END of fortuneButtonTap
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        fortuneButtonTap(self)
    }
    
    
    

    
    
}



















