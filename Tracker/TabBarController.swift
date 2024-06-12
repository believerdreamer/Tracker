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
         settingTabBar()
         settingDeviderLine()
     }
    
    private func settingDeviderLine() {
        tabBar.layer.borderColor = UIColor.gray.cgColor
           tabBar.layer.borderWidth = 1.0
           tabBar.clipsToBounds = true
       }
    
    func settingTabBar() {
        let trackersVC = TrackersViewController()
        let statisticsVC = StatisticViewController()
        
        trackersVC.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: UIImage(named: "Trackers Bar Icon No Tapped"),
            selectedImage: UIImage(named: "Trackers Bar Icon Tapped"))
        
        statisticsVC.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: UIImage(named: "Statistic Bar Icon No Tapped"),
            selectedImage: UIImage(named: "Statistic Bar Icon Tapped"))
        
        let trackersNavController = UINavigationController(rootViewController: trackersVC)
        let statisticsNavController = UINavigationController(rootViewController: statisticsVC)
        
        // Убедитесь, что первая вкладка - Трекеры
        viewControllers = [trackersNavController, statisticsNavController]
    }

}
