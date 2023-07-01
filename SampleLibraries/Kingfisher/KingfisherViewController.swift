//
//  KingfisherViewController.swift
//  SampleLibiraries
//
//  Created by sakiyamaK on 2020/09/12.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Kingfisher

final class KingfisherViewController: UIViewController {

    @IBOutlet private weak var imageView1: UIImageView! {
        didSet {
            imageView1.image = defImage
        }
    }
    @IBOutlet private weak var imageView2: UIImageView! {
        didSet {
            imageView2.image = defImage
        }
    }
    @IBOutlet private weak var imageView3: UIImageView! {
        didSet {
            imageView3.image = defImage
        }
    }
    @IBOutlet private weak var imageView4: UIImageView! {
        didSet {
            imageView4.image = defImage
        }
    }
    @IBOutlet private weak var imageView5: UIImageView! {
        didSet {
            imageView5.image = defImage
        }
    }
    @IBOutlet private weak var imageView6: UIImageView! {
        didSet {
            imageView6.image = defImage
        }
    }

    private let defImage = UIImage(named: "DefImage")

    private let urls = [
        URL(string: "https://img.game8.jp/4462434/65ea08dfa0e71d61ed3a20d04a12e8f5.jpeg/show"),
        URL(string: "https://img.game8.jp/4079413/e444cce96b81217ffc24a628e644cad0.jpeg/show"),
        URL(string: "https://img.game8.jp/4079599/6c91230caafc83f374734fd44d8a4d39.jpeg/show"),
        URL(string: "https://img.game8.jp/4079512/124168df8992456d61a26ecb225c3131.jpeg/show"),
        URL(string: "https://img.game8.jp/4425961/f303ec20e94c43c76075ad3105c3700a.png/show"),
        URL(string: "https://img.game8.jp/4079459/99da1a73ef29041497080c73e9a192ac.jpeg/show")
    ]

    private lazy var imageViews = [imageView1, imageView2,
                                   imageView3, imageView4,
                                   imageView5, imageView6
    ]

    @IBOutlet private weak var loadButton: UIButton! {
        didSet {
            loadButton.addTarget(self, action: #selector(tapLoadButton(_:)), for: .touchUpInside)
        }
    }

    @objc func tapLoadButton(_ sender: UIButton) {

        urls.enumerated().map { ($0.element, imageViews[$0.offset]) }.forEach {
            guard let url = $0.0, let imageView = $0.1 else { return }
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: url,
                placeholder: defImage
            )
        }
    }
}
