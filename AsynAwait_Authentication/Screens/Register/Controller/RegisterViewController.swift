//
//  RegisterViewController.swift
//  AsynAwait_Authentication
//
//  Created by Quick tech  on 04/10/24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    private let viewModel = RegisterVm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        guard let fname = fname.text else { return }
        guard let lname = lname.text else { return }
        guard let email = email.text else { return }
        guard let password = password.text else { return }
        let register = Register(first_name: fname, last_name: lname, email: email, password: password)
        viewModel.registeration(parameters: register)
    }
}
