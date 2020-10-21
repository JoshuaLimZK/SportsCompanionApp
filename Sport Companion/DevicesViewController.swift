//
//  DevicesViewController.swift
//  Sport Companion
//
//  Created by Joshua Lim on 21/10/20.
//

import UIKit

class DevicesViewController: UIViewController {
    
    
    @IBOutlet weak var pingButton: UIButton!
    @IBOutlet weak var sendTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeReconfigure: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var durationOfExerciseLabel: UILabel!
    @IBOutlet weak var showCommandLineButton: UIButton!
    @IBOutlet weak var commandLineDisplay: UITextView!
    
    var commandLine: [String]?
    var commandLineHidden = true
    
    var numberOfTimesPerDay = 1
    var durationOfExercise = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        timeReconfigure.isHidden = true
        timeReconfigure.layer.cornerRadius = 10
        
        commandLineDisplay.isHidden = true
        pingButton.isHidden = true
        sendTextField.isHidden = true
    }
    
    
    
    @IBAction func pingPressed(_ sender: Any) {
        
        if let sendTextField = sendTextField.text {
            postAccelerometerDataX(data: sendTextField)
            commandLine?.append(sendTextField)

        }
        
        sendTextField.text = ""
        
        
    }
    
    
    
    func postAccelerometerDataX(data: String) {
        let parameters = ["value": data] //"\(String(format: "%.02f", 3456789))"]
        guard let url = URL(string: "https://io.adafruit.com/api/feeds/remibotapp/data.json?X-AIO-Key=aio_kZTr583ObBr80iGLrIY7bFQEzMhU") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
                self.commandLineDisplay.text = "\(self.commandLineDisplay.text)\n\(response)"
                
                
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    self.commandLineDisplay.text = "\(String(describing: self.commandLineDisplay.text))\n\(json)"
                    print("Success")
                    self.commandLineDisplay.text = "\(String(describing: self.commandLineDisplay.text))\nSuccess"
                } catch {
                    print("Failed")
                    //print(error)
                    self.commandLineDisplay.text = "\(String(describing: self.commandLineDisplay.text))\nFailed"
                }
            }
        }.resume()
    }
    
    @IBAction func configureDates(_ sender: Any) {
        performSegue(withIdentifier: "timing", sender: nil)
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        if slider.value <= 1 {
            slider.value = 0
        } else if slider.value <= 3 {
            slider.value = 2
        } else if slider.value <= 5 {
            slider.value = 4
        } else if slider.value <= 7 {
            slider.value = 6
        } else {
            slider.value = 8
        }
        
        if slider.value == 0.0 {
            numberLabel.text = "Number of times per day: 1"
            
            numberOfTimesPerDay = 1
            
        } else if slider.value == 2.0 {
            numberLabel.text = "Number of times per day: 2"
            
            numberOfTimesPerDay = 2

        } else if slider.value == 4.0 {
            numberLabel.text = "Number of times per day: 3"
            
            numberOfTimesPerDay = 3

        } else if slider.value == 6.0 {
            numberLabel.text = "Number of times per day: 4"
            
            numberOfTimesPerDay = 4

        } else if slider.value == 8.0 {
            numberLabel.text = "Number of times per day: 5"
            
            numberOfTimesPerDay = 5

        }
        
        timeReconfigure.isHidden = false
        
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "timing" {
            let timeTableViewController = segue.destination as! TimeTableViewController
            timeTableViewController.numberOfTimings = numberOfTimesPerDay
        }
        
     }
    
    @IBAction func stepperChanged(_ sender: Any) {
        
        durationOfExerciseLabel.text = "Duration of Exercise: \(stepper.value.description) min"
        
    }
    
    @IBAction func showCommandPressed(_ sender: Any) {
        
        if commandLineHidden == true {
            commandLineDisplay.isHidden = false
            pingButton.isHidden = false
            sendTextField.isHidden = false
            showCommandLineButton.titleLabel?.text = "Show Command Line"
            
            commandLineHidden = false
            
            print("command line Shown")

            
        } else if commandLineHidden == false {
            commandLineDisplay.isHidden = true
            pingButton.isHidden = true
            sendTextField.isHidden = true
            showCommandLineButton.titleLabel?.text = "Hide Command Line"
            
            commandLineHidden = true
            
            print("command line hidden")
            
        }
    }
    
}
