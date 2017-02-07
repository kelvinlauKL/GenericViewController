//
//  SeasonCell.swift
//  GenericViewController
//
//  Created by Kelvin Lau on 2017-02-07.
//  Copyright © 2017 Kelvin Lau. All rights reserved.
//

import UIKit

final class SeasonCell: UITableViewCell {
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: .value1, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
