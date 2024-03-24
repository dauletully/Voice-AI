//
//  ViewController.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 21.03.2024.
//

import UIKit
//MARK: - Controller
class HomeController: UIViewController {
    var speechView = AISpeechView()
    let filterData = ["Hot", "My Voices", "Charachter", "Music", "Actor"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view = speechView
        setup()
    }
    //MARK: - Setup
    private func setup() {
        speechView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
//MARK: - Extension
extension HomeController: SelectCollectionDelegate {
    func showElementsCollection(nameCategory: String) {
        print(nameCategory)
    }

}

