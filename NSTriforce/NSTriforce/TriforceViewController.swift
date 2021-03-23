//
//  TriforceViewController.swift
//  NSTriforce
//
//  Created by Nikita Sosyuk on 19.03.2021.
//

import UIKit

class TriforceViewController: UIViewController {

    let triforceView = TriforceView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 2 - 100, width: 200, height: 200))

    var numberOfLevels = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Triforce"
        view.backgroundColor = .yellow
        view.addSubview(triforceView)
        triforceView.drawNodes(count: numberOfLevels)
    }
}

