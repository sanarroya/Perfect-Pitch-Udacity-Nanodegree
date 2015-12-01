//
//  PlaySoundsViewController.swift
//  Perfect Pitch
//
//  Created by Santiago Avila Arroyave on 11/29/15.
//  Copyright © 2015 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var recordedAudio: RecordedAudio!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playSlowAudio(sender: AnyObject) {
        fastAndSlowAudio(0.2)
    }
    
    @IBAction func playFastAudio(sender: AnyObject) {
        fastAndSlowAudio(2.5)
    }
    
    @IBAction func playChipmunkAudio(sender: AnyObject) {
        fastAndSlowAudio(1.0)
    }
    
    
    @IBAction func playDarthVaderAudio(sender: AnyObject) {
    }
    
    func loadAudioFile() -> AVAudioPlayer{
        var audio: AVAudioPlayer?
        do{
            try audio = AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl)
        }catch {
            print("Player not available")
        }
        return audio!
    }
    
    func fastAndSlowAudio(rate: Float) {
        audioPlayer?.stop()
        audioPlayer = loadAudioFile()
        audioPlayer?.enableRate = true
        audioPlayer?.rate = rate
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
}
