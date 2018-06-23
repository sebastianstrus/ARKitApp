//
//  MainMenuVC.swift
//  ARKitApp
//
//  Created by Sebastian Strus on 2018-06-11.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit
import ARKit


class MainMenuVC: UIViewController {
    
    var textToGenerate: String?
    var positionVector: SCNVector3?
    var scaleVector: SCNVector3?
    var textColor: UIColor = .black
    
    @IBOutlet weak var textToGenerateTF: UITextField!
    @IBOutlet weak var xPositionTF: UITextField!
    @IBOutlet weak var yPositionTF: UITextField!
    @IBOutlet weak var zPositionTF: UITextField!
    @IBOutlet weak var xScaleTF: UITextField!
    @IBOutlet weak var yScaleTF: UITextField!
    @IBOutlet weak var zScaleTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainMenuVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainMenuVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    //prevents landscape in this controller
    override open var shouldAutorotate: Bool {
        return false
    }
    
    
    @IBAction func generatePressed(_ sender: BorderButton) {
        textToGenerate = textToGenerateTF.text
        positionVector = SCNVector3(Double((xPositionTF.text)!)!, Double((yPositionTF.text)!)!, Double((zPositionTF.text)!)!)
        scaleVector = SCNVector3(Double((xScaleTF.text)!)! / 100, Double((yScaleTF.text)!)! / 100, Double((zScaleTF.text)!)! / 100)
        performSegue(withIdentifier: "GoToScene", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GoToScene") {
            let vc = segue.destination as! SceneVC
            vc.textOnScene = textToGenerate
            vc.pVector = positionVector
            vc.sVector = scaleVector
            vc.textColor = textColor
        }
    }    
    
    // Handle keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func changeColorAction(_ sender: UIButton) {
        textToGenerateTF.textColor = sender.backgroundColor
        textColor = sender.backgroundColor!
        
        //animate pressed button
        sender.bounce()
    }

}

