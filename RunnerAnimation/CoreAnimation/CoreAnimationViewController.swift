//
//  CoreAnimationViewController.swift
//  RunnerAnimation
//
//  Created by Sentinel on 3/1/24.
//

import UIKit

class CoreAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureButtons()
    }
    
    private func configureButtons() {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 5.0
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true
        
        let startButton = PrimaryButton(type: .roundedRect)
        startButton.configure(with: "Start Running")
        buttonStackView.addArrangedSubview(startButton)
        
        let stopButton = PrimaryButton(type: .roundedRect)
        stopButton.configure(with: "Stop Running")
        buttonStackView.addArrangedSubview(stopButton)
 
//        let startButton = UIButton(type: .roundedRect)
//        startButton.setTitle("Start Running", for: .normal)
//
//        startButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
//        buttonStackView.addSubview(startButton)
//        startButton.translatesAutoresizingMaskIntoConstraints = false
//        startButton.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
//        let stopButton = UIButton(type: .roundedRect)
//        stopButton.setTitle("Stop Running", for: .normal)
//        stopButton.backgroundColor = .systemPurple
//        stopButton.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
//        buttonStackView.addSubview(stopButton)
//        stopButton.translatesAutoresizingMaskIntoConstraints = false
//        stopButton.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
    }
    
    @objc private func startAnimation() {
        
    }
    
    @objc private func stopAnimation() {
        
    }
}

class PrimaryButton: UIButton {
    
    func configure(with text: String) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 361.0).isActive = true
        setAttributedTitle(NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white,
                                                                         .font: UIFont(name: "Bradley Hand Bold", size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)]), for: .normal)
        setTitle(text, for: .normal)
        backgroundColor = .systemPurple
        layer.cornerRadius = 5.0
    }
}
