//
//  String+BoundingRect.swift
//  Cleverbot
//
//  Created by Suyeol Jeon on 01/03/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

extension String {
  func boundingRect(with size: CGSize, attributes: [NSAttributedStringKey: Any]?) -> CGRect {
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let rect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
    return snap(rect)
  }

  func size(thatFits size: CGSize, font: UIFont, maximumNumberOfLines: Int = 0) -> CGSize {
    var size = self.boundingRect(with: size, attributes: [.font: font]).size
    if maximumNumberOfLines > 0 {
      size.height = min(size.height, CGFloat(maximumNumberOfLines) * font.lineHeight)
    }
    return snap(size)
  }

  func width(with font: UIFont, maximumNumberOfLines: Int = 0) -> CGFloat {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    return self.size(thatFits: size, font: font, maximumNumberOfLines: maximumNumberOfLines).width
  }

  func height(thatFitsWidth width: CGFloat, font: UIFont, maximumNumberOfLines: Int = 0) -> CGFloat {
    let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
    return self.size(thatFits: size, font: font, maximumNumberOfLines: maximumNumberOfLines).height
  }
}
