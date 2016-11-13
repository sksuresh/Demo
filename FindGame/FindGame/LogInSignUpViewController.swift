//
//  ViewController.swift
//  FindGame
//
//  Created by SureshDokula on 21/05/16.
//  Copyright © 2016 MDTMAC. All rights reserved.
//

import UIKit

class LogInSignUpViewController: MGBaseViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func ForGotPassword(sender: AnyObject) {
    }

    @IBAction func SingnUpClicked(sender: AnyObject) {
    }
    @IBAction func FaceBookLogin(sender: AnyObject) {
    }
    @IBAction func LoginClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("HomePage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("navigate to home")
    }
}

