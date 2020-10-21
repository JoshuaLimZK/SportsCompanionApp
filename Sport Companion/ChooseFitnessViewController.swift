//
//  ChooseFitnessViewController.swift
//  Sport Companion
//
//  Created by Joshua Lim on 20/10/20.
//

import UIKit

class ChooseFitnessViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if #available(iOS 13.0, *) {
            self.presentationController?.containerView?.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        nextButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        if slider.value < 0.375 {
            slider.value = 0
        } else if slider.value > 0.875 {
            slider.value = 1
        } else {
            slider.value = 0.5
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
