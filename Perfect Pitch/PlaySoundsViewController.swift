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
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: recordedAudio.filePathUrl)
        audioPlayer = loadAudioFile()

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
        playAudioWithVariablePitch(1000.0)
    }
    
    
    @IBAction func playDarthVaderAudio(sender: AnyObject) {
        playAudioWithVariablePitch(-1000.0)
    }
    
    @IBAction func playEchoAudio(sender: AnyObject) {
        playAudioWithEcho()
    }
    
    @IBAction func playReverbAudio(sender: AnyObject) {
        playAudioWithReverb()
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
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer?.stop()
        audioPlayer?.enableRate = true
        audioPlayer?.rate = rate
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()

        audioPlayerNode.play()
    }
    
    func playAudioWithReverb() {
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let reverbEffect = AVAudioUnitReverb()
        reverbEffect.wetDryMix = 50.0
        audioEngine.attachNode(reverbEffect)
        
        audioEngine.connect(audioPlayerNode, to: reverbEffect, format: nil)
        audioEngine.connect(reverbEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    func playAudioWithEcho() {
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let echoEffect = AVAudioUnitDelay()
        audioEngine.attachNode(echoEffect)
        
        audioEngine.connect(audioPlayerNode, to: echoEffect, format: nil)
        audioEngine.connect(echoEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
}
