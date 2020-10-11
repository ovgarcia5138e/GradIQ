//
//  Colors.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit

class Colors {
    var gl:CAGradientLayer!

        init() {
            let colorTop = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor

            self.gl = CAGradientLayer()
            self.gl.colors = [colorTop, colorBottom]
            self.gl.locations = [0.0, 1.0]
        }
}
