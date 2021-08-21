//
//  LoginViewController.swift
//  InstagramLikeApp
//
//  Created by Юлия Караневская on 19.08.21.
//

import UIKit
import SafariServices

struct Constants {
    static let cornerRadius: CGFloat = 10
}

class LoginViewController: UIViewController {
    
    //MARK: UI
    
    private let userNameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email or Name..."
        field.returnKeyType = .next
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.gray.cgColor
        return field
    }()
    
    private let userPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.gray.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        button.setTitle("Privacy policy", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create an account", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        return button
    }()
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.clipsToBounds = true
        headerView.backgroundColor = .systemPink
        let imageGradient = UIImageView(image: UIImage(named: "gradient"))
        headerView.addSubview(imageGradient)
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureElementsConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(userNameEmailField)
        view.addSubview(userPasswordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        userNameEmailField.delegate = self
        userPasswordField.delegate = self
    }
    
    @objc private func didTapLoginButton() {
        userNameEmailField.resignFirstResponder()
        userPasswordField.resignFirstResponder()
        
        guard let user = userNameEmailField.text,
              !user.isEmpty,
              let password = userPasswordField.text,
              !password.isEmpty,
              password.count >= 8 else { return }
        
        //login functionality
       
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegisterViewController()
        present(vc, animated: true, completion: nil)
    }
    
    private func configureElementsConstraints() {
        //configure headerView
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height / 3)
        configureHeaderViewImage()
        
        userNameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 10, width: view.width - 50, height: 44)
        
        userPasswordField.frame = CGRect(x: 25, y: userNameEmailField.bottom + 10, width: view.width - 50, height: 44)
        
        loginButton.frame = CGRect(x: 25, y: userPasswordField.bottom + 10, width: view.width - 50, height: 44)
        
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.width - 50, height: 44)
        
        termsButton.frame = CGRect(x: 25, y: view.height - view.safeAreaInsets.bottom - 88, width: view.width - 50, height: 44)
        
        privacyButton.frame = CGRect(x: 25, y: view.height - view.safeAreaInsets.bottom - 44, width: view.width - 50, height: 44)
        
    }
    
    
    private func configureHeaderViewImage() {
        guard headerView.subviews.count == 1 else { return }
        guard let headerViewImage = headerView.subviews.first else { return }
        headerViewImage.frame = headerView.bounds
        
        let logoText = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(logoText)
        logoText.contentMode = .scaleAspectFit
        logoText.frame = CGRect(x: headerView.width / 4, y: view.safeAreaInsets.top, width: headerView.width / 2, height: headerView.height - view.safeAreaInsets.top)
    }

}

//MARK: - textField delegate methods
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameEmailField {
            userPasswordField.becomeFirstResponder()
        } else if textField == userPasswordField {
            didTapLoginButton()
        }
        return true
    }
}
