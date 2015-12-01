//
//  ViewController.swift
//  Perfect Pitch
//
//  Created by Santiago Avila Arroyave on 11/29/15.
//  Copyright © 2015 Santiago Avila Arroyave. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var pauseRecordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    var audioRecorder: AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    var isRecording: Bool = false
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pauseRecordButton.hidden = true
        stopRecordButton.hidden = true
        recordButton.enabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startRecording(sender: AnyObject) {
        
        recordLabel.text = "Recording!"
        
        if(isRecording) {
            audioRecorder.record()
            recordButton.enabled = true
            pauseRecordButton.enabled = false
        }else {
            isRecording = true
            pauseRecordButton.hidden = false
            stopRecordButton.hidden = false
            recordButton.enabled = false
            recordAudio()
        }
        
    }
    
    @IBAction func pauseResumeRecording(sender: AnyObject) {
            audioRecorder.pause()
            recordButton.enabled = true
            pauseRecordButton.enabled = false
            recordLabel.text = "Recording paused, tap mic to continue"
    }

    @IBAction func stopRecording(sender: AnyObject) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        recordLabel.text = "Tap to record!"
        recordButton.enabled = true
    }
    
    func recordAudio() {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "My_Audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if(flag) {
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            self.performSegueWithIdentifier("playSounds", sender: recordedAudio)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playSounds") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.recordedAudio = data
        }
    }
}

