//
//  MainViewController.swift
//  AnswerBall
//
//  Created by Robert Rock on 12/12/15.
//  Copyright © 2015 Robert Rock. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var fortuneLabel: UILabel!

    var audioPlayer = AVAudioPlayer()
    
    var answers = [
        "Blue Dream",
        "Strawberry Kush",
        "OG Kush",
        "Cherry Pie",
        "Purple Urple",
        "Khalifa Kush",
        "King Louie 13th",
        "Purple Haze",
        "Pineapple Express",
        "Girl Scout Cookies",
        "Train Wreck",
        "Blue Satellite",
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fortuneLabel.text = "Strain"
        
    }

    
    // MARK: Actions
    
    @IBAction func fortuneButtonTap(sender: AnyObject) {
    
        // Get random # from array.count
        let random = Int(arc4random_uniform(UInt32(answers.count)))
        
        // Display answer
        fortuneLabel.text = answers[random]
        
        // Play sound
        do {
            try playSound("shakesound", fileExtension: "wav")
        } catch {
            return
        }
        
    } // END of fortuneButtonTap
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        fortuneButtonTap(self)
    }
    
    
    func playSound(fileName: String, fileExtension: String) throws {
        
        let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, { let mainBundle = NSBundle.mainBundle()
            
            let filePath = mainBundle.pathForResource("\(fileName)", ofType:"\(fileExtension)")
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                do {
                    /* Start the audio player */
                    self.audioPlayer = try AVAudioPlayer(data: fileData!)
                    
                    guard let player : AVAudioPlayer? = self.audioPlayer else {
                        return
                    }
                    
                    /* Set the delegate and start playing */
                    player!.delegate = self
                    if player!.prepareToPlay() && player!.play() {
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                } catch {
                    //self.audioPlayer = nil
                    return
                }
            }
        })
        
    } // END of playSound()

    
    
}



















