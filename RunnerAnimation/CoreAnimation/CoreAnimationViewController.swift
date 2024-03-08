//
//  CoreAnimationViewController.swift
//  RunnerAnimation
//
//  Created by Sentinel on 3/1/24.
//

import UIKit

class CoreAnimationViewController: UIViewController {
    private enum Constants {
        static let stackSpace = 5.0
        static let sideInset = 16.0
    }
    
    private var animationView = AnimationImageView()
    private var images = [
        UIImage(named: "1") ?? UIImage(),
        UIImage(named: "2") ?? UIImage(),
        UIImage(named: "3") ?? UIImage(),
        UIImage(named: "4") ?? UIImage()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        configureButtons()
    }
    
    private func configureView() {
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        animationView.image = UIImage(named: "1")
    }
    
    private func configureButtons() {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.spacing = Constants.stackSpace
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideInset).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.sideInset).isActive = true
        
        let startButton = PrimaryButton(type: .roundedRect)
        startButton.configure(with: "Start Running")
        startButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        buttonStackView.addArrangedSubview(startButton)
        
        let stopButton = PrimaryButton(type: .roundedRect)
        stopButton.configure(with: "Stop Running")
        stopButton.addTarget(self, action: #selector(stopAnimation), for: .touchUpInside)
        buttonStackView.addArrangedSubview(stopButton)
    }
    
    @objc private func startAnimation() {
        animationView.animationImages = images
        animationView.animationDuration = 0.5
        animationView.startAnimating()
    }
    
    @objc private func stopAnimation() {
        animationView.stopAnimating()
    }
}

class AnimationImageView: UIImageView {
    // MARK: Overrides
        override func startAnimating() {
            guard let frames = animationImages, frames.count > 1 else {
                return
            }
            image = frames.first
            
            let timePerFrame = animationDuration / Double(frames.count)
            let timer = Timer(fire: Date(timeIntervalSinceNow: timePerFrame),
                              interval: timePerFrame,
                              repeats: true) { [weak self] _ in
                self?.changeFrame()
            }
            RunLoop.current.add(timer, forMode: .common)
            frameTimer = timer
        }
        
        override func stopAnimating() {
            frameTimer?.invalidate()
            frameTimer = nil
            currentFrameIndex = 0
        }
        
        // MARK: Private
        private var frameTimer: Timer?
        private var isAnimatingForward = true
        
        private var currentFrameIndex = 0 {
            didSet {
                if let frames = animationImages,
                   currentFrameIndex >= 0,
                   currentFrameIndex < frames.count {
                    image = frames[currentFrameIndex]
                }
            }
        }
        
        private func changeFrame() {
            guard let frames = animationImages, frames.count > 1 else {
                stopAnimating()
                return
            }
            
            let canAnimateForward = currentFrameIndex < frames.count - 1
            let canAnimateBackward = currentFrameIndex > 0
            isAnimatingForward = (isAnimatingForward && canAnimateForward) || (!isAnimatingForward && !canAnimateBackward)
            currentFrameIndex += isAnimatingForward ? 1 : -1
        }
}
