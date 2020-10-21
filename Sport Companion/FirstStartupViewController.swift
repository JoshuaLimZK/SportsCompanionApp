//
//  FirstStartupViewController.swift
//  Sport Companion
//
//  Created by Joshua Lim on 20/10/20.
//

import UIKit

class FirstStartupViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            self.presentationController?.containerView?.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        getStartedButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
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
