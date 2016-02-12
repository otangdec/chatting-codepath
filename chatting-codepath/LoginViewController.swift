//
//  LoginViewController.swift
//  chatting-codepath
//
//  Created by Oranuch on 2/11/16.
//  Copyright © 2016 horizon. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(sender: AnyObject) {
        myMethod()
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        loginMethod()
    }
    
    func errorAlert () {
        let alertController = UIAlertController(title: "error", message: "something went wrong", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func loginMethod(){
        
        PFUser.logInWithUsernameInBackground(userName.text!, password:userPassword.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                
                
                
            }else {
            self.errorAlert()
            }
        }
    }
    
    
    
    func myMethod() {
        var user = PFUser()
        user.username = userName.text
        user.password = userPassword.text
        user.email = userEmail.text
        // other fields can be set just like with PFObject
//        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                self.errorAlert()
                // Show the errorString somewhere and let the user try again.
            } else {
                print("GOT LOGGED")
                // Hooray! Let them use the app now.
            }
            
        }
    
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        let ChatViewController = segue.destinationViewController as! ChatViewController

        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
