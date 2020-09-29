//
//  ViewController.swift
//  XO
//
//  Created by bashayer Al qaoud on 9/28/20.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    var buttons: [UIButton] = []
    var counter = 0
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Water Drop Sound High-SoundBible.com-1387792987", ofType: "mp3")!))
        } catch  {
            print(error)
        }
    }
    
    @IBAction func click(_ sender: UIButton) {
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            turnLabel.text = "O turn"
            checkWinner(P: "X")
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.lightGray, for: .normal)
            turnLabel.text = "x turn"
            checkWinner(P: "O")
        }
       
        counter += 1
        print(counter)
        sender.isEnabled = false
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        audioPlayer.play()
       
    }
    
    

    @IBAction func resetClicked() {
        restartGame()
    }
    
    func checkWinner(P: String) {
       
        let r1 = b1.titleLabel?.text == P && b2.titleLabel?.text == P && b3.titleLabel?.text == P
        let r2 = b4.titleLabel?.text == P && b5.titleLabel?.text == P && b6.titleLabel?.text == P
        let r3 = b7.titleLabel?.text == P && b8.titleLabel?.text == P && b9.titleLabel?.text == P
        
        let c1 = b1.titleLabel?.text == P && b4.titleLabel?.text == P && b7.titleLabel?.text == P
        let c2 = b2.titleLabel?.text == P && b5.titleLabel?.text == P && b8.titleLabel?.text == P
        let c3 = b3.titleLabel?.text == P && b6.titleLabel?.text == P && b9.titleLabel?.text == P
        
        let d1 = b1.titleLabel?.text == P && b5.titleLabel?.text == P && b9.titleLabel?.text == P
        let d2 = b3.titleLabel?.text == P && b5.titleLabel?.text == P && b7.titleLabel?.text == P
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            print("\(P) wins")
            let alertController = UIAlertController(title: "\(P) is the winner", message: "click to replay", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "replay", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)

        }
       

    }
    
    func restartGame() {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        
        counter = 0
        turnLabel.text = "X turn"
    }
    
   
}

