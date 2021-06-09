//
//  LoginVC.swift
//  login
//
//  Created by ishwar lal janwa on 09/06/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtEmail: DTTextField!
    @IBOutlet weak var txtPassword: DTTextField!
    
    var viewModel : LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = LoginViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }


}

// MARK: User Define Methods
extension LoginVC{
    
    @objc func keyboardWillShow(notification:Notification) {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight.height, right: 0)
    }
    
    @objc func keyboardWillHide(notification:Notification) {
        scrollView.contentInset = .zero
    }
    
    func clearForm() {

        self.txtEmail.text           = ""
        self.txtPassword.text        = ""
    }
}

// MARK: User Define Actions
extension LoginVC{
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard viewModel.validateData(txtEmail, txtPassword: txtPassword) else {
            return
        }
        
        let alert = UIAlertController(title: "Success", message: "You are login successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (cancel) in
            DispatchQueue.main.async { self.clearForm() }
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
