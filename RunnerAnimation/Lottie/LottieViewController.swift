//
//  LottieViewController.swift
//  RunnerAnimation
//
//  Created by Sentinel on 3/1/24.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    private enum Constants {
        static let lottieFile = "runner"
    }
    
    @IBOutlet private var animationView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func startAnimation() {
        animationView.animation = .named(Constants.lottieFile, animationCache: .none)
        animationView.loopMode = .loop
        animationView.play()
    }
    
    @IBAction private func stopAnimation() {
        animationView.stop()
    }
    
    @IBAction private func showCoreAnimationScreen() {
        let controller = CoreAnimationViewController()
        present(controller, animated: true)
    }
}

