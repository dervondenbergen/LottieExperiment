//
//  AnimationsList.swift
//  LottieExperiment
//
//  Created by Felix De Montis on 07.02.22.
//

import Foundation
import Lottie
import UIKit

extension Lottie.Animation {
    public static func asset(
      _ name: String,
      bundle: Bundle = Bundle.main)
      -> Animation?
    {
        do {
            /// Decode animation.
            let animationData = NSDataAsset(name: name, bundle: bundle)
            let animation = try JSONDecoder().decode(Animation.self, from: animationData!.data)
            return animation
        } catch {
            /// Decoding error.
            print(error)
            return nil
        }
    }
}
