//
//  TabBarMenuViewController.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 23.03.2024.
//

import UIKit

final class TabBarMenu: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let coversNavController = configureTabBar(vc: HomeController(), 
                                                  title: "AI Covers",
                                                  image: "music.quarternote.3")
        let speechNavController = configureTabBar(vc: HomeController(), 
                                                  title: "AI Speech",
                                                  image: "mic")
        let recordingNavController = configureTabBar(vc: HomeController(), 
                                                     title: "Recordings", 
                                                     image: "music.note.list")

        viewControllers = ([coversNavController, speechNavController, recordingNavController])
    }
    //MARK: - Set tabBar item
    private func configureTabBar(vc: UIViewController, title: String, image: String) -> UINavigationController  {

        let viewController = vc
        tabBar.tintColor = UIColor(named: "MainColor")
        tabBar.backgroundColor = UIColor(named: "DarkGrey")
        tabBar.unselectedItemTintColor = UIColor(named: "gray2")
//        tabBar.backgroundColor = UIColor(named: "DarkGrey")

        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(systemName: image)
        return UINavigationController(rootViewController: viewController)

    }

}
