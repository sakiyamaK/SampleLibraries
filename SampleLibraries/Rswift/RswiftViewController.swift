//
//  RswiftViewController.swift
//  SampleLibiraries
//
//  Created by sakiyamaK on 2020/09/11.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class Hoge {
    func hoge() {
    }

    func a() {
    }
}

final class RswiftViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Assets
        // color
        let m = R.color.mainColor

        // image
        let img = R.image.defImage

        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc func tapButton() {
        // storyboard
        let vc = R.storyboard.activeLabel.instantiateInitialViewController()!
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
