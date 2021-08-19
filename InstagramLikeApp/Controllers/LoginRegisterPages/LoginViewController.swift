//
//  LoginViewController.swift
//  InstagramLikeApp
//
//  Created by Юлия Караневская on 19.08.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: UI
    
    private let userNameEmailField: UITextField = {
        let field = UITextField()
        return field
    }()
    
    private let userPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        return button
    }()
    
    private let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //add constraints to UI elements
    }
    
    private func addSubviews() {
        view.addSubview(userNameEmailField)
        view.addSubview(userPasswordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapTermsButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccountButton() {}
    
    


}
