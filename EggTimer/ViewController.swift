//
//  ViewController.swift
//  EggTimer
//
//  Created by Muhammad Taimoor Hassan on 03/03/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: OUTLETS
    
    @IBOutlet weak var eggStatusLabl: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: VARIABLES
    var eggTimes : [String:Int] = ["Soft":10,"Medium":20,"Hard":30]
    var timer = Timer()
    var totalTime = 0
    var secPassed = 0
    var player: AVAudioPlayer!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Working On It to Change Label "
        
        progressBar.progress = 0.0
        progressBar.layer.cornerRadius = 5
        
    }
    
    // MARK: eggPressed [Button]
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        guard let hardness = sender.titleLabel?.text else { return }
        textLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            
            if secPassed <= totalTime  {
                
                print ("\(self.secPassed) seconds.")
                
                self.textLabel.text = "\(self.secPassed) seconds."
                
                progressBar.progress = Float(secPassed) / Float(totalTime)
                
                self.secPassed += 1
                
            } else {
                Timer.invalidate()
                self.textLabel.text = "Done! Egg is Ready."
                
                let url = Bundle.main.url(forResource: "anda", withExtension: "mp3")
                   player = try! AVAudioPlayer(contentsOf: url!)
                   player.play()
            }
        }
    }
}
