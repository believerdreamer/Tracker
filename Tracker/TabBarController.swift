//
//  TabBarController.swift
//  Tracker
//
//  Created by Архип Семёнов on 07.06.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
         super.viewDidLoad()
         
         let trackersVC = TrackersViewController()
         let statisticsVC = StatisticsViewController()
         
         trackersVC.tabBarItem = UITabBarItem(title: "Трекеры", image: UIImage(systemName: "list.bullet"), tag: 0)
         statisticsVC.tabBarItem = UITabBarItem(title: "Статистика", image: UIImage(systemName: "chart.bar"), tag: 1)
         
         let trackersNavController = UINavigationController(rootViewController: trackersVC)
         let statisticsNavController = UINavigationController(rootViewController: statisticsVC)
         
         viewControllers = [trackersNavController, statisticsNavController]
     }
}
