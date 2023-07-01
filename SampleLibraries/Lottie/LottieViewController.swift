//
//  LottieViewController.swift
//  SampleLibiraries
//
//  Created by sakiyamaK on 2020/09/12.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

final class LottieViewController: UIViewController {

    private var isPlaying: Bool = false

    private let animationView1 = LottieAnimationView()
    @IBOutlet private weak var animationContainerView1: UIView! {
        didSet {
            guard let animation = LottieAnimation.named("9965-loading-spinner", subdirectory: nil) else {
                print("\(#line) file not found")
                return
            }
            animationContainerView1.addSubview(animationView1)
            animationView1.snp.makeConstraints { $0.edges.equalToSuperview() }
            animationView1.contentMode = .scaleAspectFit
            animationView1.animation = animation
        }
    }

    private let animationView2 = LottieAnimationView()
    @IBOutlet private weak var animationContainerView2: UIView! {
        didSet {
            guard let animation = LottieAnimation.named("32910-success", subdirectory: nil) else {
                print("\(#line) file not found")
                return
            }
            animationContainerView2.addSubview(animationView2)
            animationView2.snp.makeConstraints { $0.edges.equalToSuperview() }
            animationView2.contentMode = .scaleAspectFit
            animationView2.animation = animation
        }
    }

    private let animationView3 = LottieAnimationView()
    @IBOutlet private weak var animationContainerView3: UIView! {
        didSet {
            guard let animation = LottieAnimation.named("32921-volumn-from-mute-to-maximum", subdirectory: nil) else {
                print("\(#line) file not found")
                return
            }
            animationContainerView3.addSubview(animationView3)
            animationView3.snp.makeConstraints { $0.edges.equalToSuperview() }
            animationView3.contentMode = .scaleAspectFit
            animationView3.animation = animation
        }
    }

    @IBOutlet private weak var animationButton: UIButton! {
        didSet {
            animationButton.addTarget(self, action: #selector(tapAnimation(_:)), for: .touchUpInside)
        }
    }
}

extension LottieViewController {
    @objc func tapAnimation(_ sender: UIButton) {
        isPlaying.toggle()
        let animationViews = [animationView1, animationView2, animationView3]
        animationViews.forEach {
            if isPlaying {
                print("playing")
                $0.animationSpeed = 0.5
                $0.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
            } else {
                print("stop")
                $0.stop()
            }
        }
    }
}
