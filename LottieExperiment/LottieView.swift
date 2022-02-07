//
//  Animation.swift
//  LottieExperiment
//
//  Created by Felix De Montis on 05.02.22.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    @Binding var playing: Bool
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> AnimationView {
        let animationView = AnimationView()
        let lottieAnimation = Animation.asset(name)
        if (lottieAnimation != nil) {
            animationView.animation = lottieAnimation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
        }
        return animationView
    }

    func updateUIView(_ uiView: AnimationView, context: Context) {
        print("update", name, loopMode, playing)
        if (loopMode != .playOnce) {
            if (playing) {
                uiView.play()
            } else {
                uiView.pause()
            }
        } else {
            if (playing) {
                uiView.play(completion: { _ in
                    resetPlayingState()
                })
            }
        }
    }
    
    func resetPlayingState() -> Void {
        playing.toggle()
    }
}
