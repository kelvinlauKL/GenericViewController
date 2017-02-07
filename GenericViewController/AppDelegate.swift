//
//  AppDelegate.swift
//  GenericViewController
//
//  Created by Kelvin Lau on 2017-02-07.
//  Copyright © 2017 Kelvin Lau. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {
  var window: UIWindow?
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let sampleEpisodes = [Episode(title: "First Episode"), Episode(title: "Second Episode"), Episode(title: "Third Episode")]
    let sampleSeasons = [Season(number: 1, title: "Season One"), Season(number: 2, title: "Season Two")]
    
    let seasonsVC = ItemsViewController(items: sampleSeasons, configure: { (cell: SeasonCell, season) in
      cell.textLabel?.text = season.title
      cell.detailTextLabel?.text = "\(season.number)"
    })
    
    seasonsVC.title = "Seasons"
    
    let nc = UINavigationController(rootViewController: seasonsVC)
    seasonsVC.didSelect = { season in
      let episodesVC = ItemsViewController(items: sampleEpisodes, configure: { cell, episode in
        cell.textLabel?.text = episode.title
      })
      episodesVC.title = "Episode"
      nc.pushViewController(episodesVC, animated: true)
    }
    window?.rootViewController = nc
    window?.makeKeyAndVisible()
    return true
  }
}

