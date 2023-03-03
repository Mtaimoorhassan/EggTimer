//
//  ViewController.swift
//  EggTimer
//
//  Created by Muhammad Taimoor Hassan on 03/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: OUTLETS
    
    @IBOutlet weak var eggStatusLabl: UILabel!
    
    // MARK: VARIABLES
    var softTime = 5
    var mediumTime = 7
    var hardTime = 12
    let softEgg = "Soft"
    let medEgg = "Medium"
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: eggPressed [Button]
    @IBAction func eggPressed(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text
       
        if let hardness {
            print(hardness)
        } else {
            print("Nothing to Print")
        }
        
       
        if hardness == softEgg {
            print ("The time For boiling Egg is: \(softTime) Minutes")
        } else if hardness == medEgg {
            print ("The time For boiling Egg is: \(mediumTime) Minutes")
        } else { print ("The time For boiling Egg is: \(hardTime) Minutes")
            
        }
    }
}
