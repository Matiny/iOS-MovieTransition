//
//  ViewController.swift
//  MovieTransition
//
//  Created by Matiny L on 6/1/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /* First we grab the player itself */
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "i95ride", ofType: "mp4")!))
        
        /* Then we render to an object */
        
        let playerLayer = AVPlayerLayer(player: player)
        
        /* Setup the frame of said layer within a CGRect of the view */
        
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        player.volume = 0
        view.layer.addSublayer(playerLayer)
        
        player.play()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let inputPlayer = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "audi", ofType: "mp4")!))
            let videoVC = AVPlayerViewController()
            videoVC.player = inputPlayer
            present(videoVC, animated: true)
        }
    }
}

