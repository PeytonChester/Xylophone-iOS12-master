//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    let soundArray: Array = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        //we don't need to use a global variable if we can pass parameters like this
        playSound(soundFileName: soundArray[sender.tag - 1])
    }
    
    func playSound(soundFileName : String) {

        let note = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        //If something can throw an error, we have to have a do block to actually run the code, and you have to "try" to run the code. If the code doesn't run, we move onto the catch block to catch and relay the error
        do {
            player = try AVAudioPlayer(contentsOf: note!, fileTypeHint: AVFileType.wav.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
        
        player.play()
    }
  

}

