//
//  ViewController.swift
//  InstagramLikeApp
//
//  Created by Юлия Караневская on 19.08.21.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //manage auth status
        manageAuth()
    }
    
    private func manageAuth() {
        if Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }


}

