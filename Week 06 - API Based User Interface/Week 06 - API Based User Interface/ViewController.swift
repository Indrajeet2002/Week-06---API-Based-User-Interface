//
//  ViewController.swift
//  week 06 API Based Interface
//
//  Created by Danyal Nemati on 9/21/23.
//

import UIKit

class ViewController: UIViewController {

    var firstButton: UIButton!
    var secondButton: UIButton!
    var b2LeadingCon: NSLayoutConstraint! // Declare it as a class-level property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        print("Begin override of loadView()")
        
        super.loadView()
        
        // create two buttons
        self.firstButton = UIButton(type: .system)
        self.firstButton.translatesAutoresizingMaskIntoConstraints = false
        self.firstButton.setTitle(
            "First Button",
            for: UIControl.State.normal
        )
        
        self.secondButton = UIButton(type: UIButton.ButtonType.infoDark)
        self.secondButton.translatesAutoresizingMaskIntoConstraints = false
        self.secondButton.setTitle(
            "Second Button",
            for: UIControl.State.normal
        )
        
        self.firstButton.addTarget(
            self,
            action: #selector(firstButtonClicked(_:)),
            for: UIControl.Event.touchUpInside
        )
        
        self.firstButton.addTarget(
            self,
            action: #selector(firstButtonDragExit(_:)),
            for: UIControl.Event.touchDragExit
        )
        
        self.view.addSubview(self.firstButton)
        
        self.secondButton.backgroundColor = UIColor.lightGray
        self.secondButton.addTarget(
            self,
            action: #selector(secondButtonClicked(_:)),
            for: UIControl.Event.touchUpInside
        )
        
        self.secondButton.addTarget(
            self,
            action: #selector(secondButtonDragExit(_:)),
            for: UIControl.Event.touchDragExit
        )
        
        self.view.addSubview(self.secondButton)
        
        let b1TrailingCon = self.firstButton.trailingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: 20
        )
        let b1TopCon = self.firstButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        b1TrailingCon.isActive = true
        b1TopCon.isActive = true
        
        b2LeadingCon = self.secondButton.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: 20
        )
        let b2TopCon = self.secondButton.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        )
        b2LeadingCon.isActive = true
        b2TopCon.isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let fourth = self.view.frame.width / 4
        self.b2LeadingCon.isActive = false
        self.b2LeadingCon = self.secondButton.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.centerXAnchor,
            constant: fourth
        )
        b2LeadingCon.isActive = true
    }
    
    @objc func firstButtonClicked(_ b: UIButton) {
        print("First button clicked!")
    }
    
    @objc func firstButtonDragExit(_ b: UIButton) {
        print("First button received a drag exit event!")
    }
    
    @objc func secondButtonClicked(_ b: UIButton) {
        print("Second button clicked!")
    }
    
    @objc func secondButtonDragExit(_ b: UIButton) {
        print("Second button received a drag exit event!")
    }
}
