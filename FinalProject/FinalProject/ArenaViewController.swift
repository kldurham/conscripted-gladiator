//
//  ArenaViewController.swift
//  FinalProject
//
//  Created by Kevin Durham on 4/19/21.
//  Copyright © 2021 Kevin Durham. All rights reserved.
//

import UIKit

class ArenaViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var badguyHP: UILabel!
    
    @IBOutlet weak var yourHP: UILabel!
    
    @IBOutlet weak var backgroundText: UITextView!
    @IBOutlet weak var combatLog: UITextView!
    
    var prd: Int = 1
    var psd: Int = 1
    var pfd: Int = 1
    var opponentType: String = ""
    var playerHP: Int = 10
    var enemyHP: Int = 10
    //var playerSwingDamage: Int = 1
    //var playerRiposteDamage: Int = 1
    //var playerFientDamage: Int = 1
    var enemySwingDamage: Int = 1
    var enemyRiposteDamage: Int = 1
    var enemyFientDamage: Int = 1
    var characterName: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = characterName
        yourHP.text = String(playerHP)
        badguyHP.text = String(enemyHP)
        combat()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSwingButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        
        //let ASView = view as! ArenaStuff;
        
        if opponentSelection == "Swing" {
            outcome = "OPPONENT ATTEMPTS TO SWING! YOUR WEAPONS COLLIDE! STALEMATE!"
        } else if opponentSelection == "Feint" {
            outcome = "OPPONENT ATTEMPTS A FEINT! YOU HIT HIM!"
            enemyHP = enemyHP - psd
            badguyHP.text = String(enemyHP)
            badguyHP.shake(duration: 0.5)
            
            
            if enemyHP <= 0 {
                outcome.append(" YOU HAVE WON!")
                displayDialog(with: outcome)
                
            }
        } else if opponentSelection == "Riposte" {
            outcome = "OPPONENT ATTEMPTS TO RIPOSTE. HE GOT YOU!"
            playerHP = playerHP - enemyRiposteDamage
            yourHP.text = String(playerHP)
            yourHP.shake(duration: 0.5)
            if playerHP <= 0 {
                outcome.append(" YOU HAVE LOST!")
                displayDialog(with: outcome)            }
            
        }
        
        combatLog.text = outcome
        //displayDialog(with: outcome)
    }
    
    @IBAction func onFeintButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        if opponentSelection == "Swing" {
            outcome = "OPPONENT ATTEMPTS TO SWING! YOU ARE HIT!"
            playerHP = playerHP - enemySwingDamage
            yourHP.text = String(playerHP)
            yourHP.shake(duration: 0.5)
            if playerHP <= 0 {
                outcome.append(" YOU HAVE LOST!")
                displayDialog(with: outcome)            }
            
        } else if opponentSelection == "Feint" {
            outcome = "OPPONENT ATTEMPTS A FEINT! STALEMATE!"
        } else if opponentSelection == "Riposte" {
            outcome = "OPPONENT ATTEMPTS TO RIPOSTE. GOT HIM!"
            enemyHP = enemyHP - pfd
            badguyHP.text = String(enemyHP)
            badguyHP.shake(duration: 0.5)
            if enemyHP <= 0 {
                outcome.append(" YOU HAVE WON!")
                displayDialog(with: outcome)            }
        }
        
        combatLog.text = outcome
        //displayDialog(with: outcome)
    }
    
    @IBAction func onRiposteButtonPress(_ sender: Any) {
        let opponentSelection: String = makeOpponentSelection()
        var outcome: String = "..."
        if opponentSelection == "Swing" {
            outcome = "OPPONENT ATTEMPTS TO SWING! YOU RIPOSTE! GOT HIM!"
            enemyHP = enemyHP - prd
            badguyHP.text = String(enemyHP)
            badguyHP.shake(duration: 0.5)
            if enemyHP <= 0 {
                outcome.append(" YOU HAVE WON!")
                displayDialog(with: outcome)            }
            
            
        } else if opponentSelection == "Feint" {
            outcome = "OPPONENT ATTEMPTS A FEINT! YOU FALL FOR IT! OUCH!"
            playerHP = playerHP - enemyFientDamage
            yourHP.text = String(playerHP)
            yourHP.shake(duration: 0.5)
            if playerHP <= 0 {
                outcome.append(" YOU HAVE LOST!")
                displayDialog(with: outcome)            }
            
        } else if opponentSelection == "Riposte" {
            outcome = "OPPONENT ATTEMPTS TO RIPOSTE. STALEMATE!"
        }
        
        combatLog.text = outcome
        //displayDialog(with: outcome)
    }
    
    func displayDialog(with dialogMessage: String) {
        // REFERENCE (UIAlertViewController): https://developer.apple.com/documentation/uikit/uialertcontroller
        
        let alert = UIAlertController(title: "", message: dialogMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {action in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func combat() {
        let randomEnemy = Int(arc4random_uniform(3)) + 1
        let randomAbility = Int(arc4random_uniform(5)) + 1
        
        if randomAbility == 1 {
            psd = psd + 1
            combatLog.text = "The adrenaline is coursing through your veins! You feel like your swing would knock down a tree!"
        }
        if randomAbility == 2 {
            pfd = pfd + 1
            combatLog.text = "The adrenaline is coursing through your veins! You feel like your feet are as fast as lightning! Maybe your feints will fool your opponent!"
        }
        if randomAbility == 3 {
            prd = prd + 1
            combatLog.text = "The adrenaline is coursing through your veins! You feel like your reflexes are beyond compare! Maybe you should focus on your ripostes!"
        }
        if randomAbility == 4 {
            psd = psd + 1
            pfd = pfd + 1
            prd = prd + 1
            combatLog.text = "The adrenaline is coursing through your veins! You feel like everything you do will be better!"
        }
        if randomAbility == 5 {
            psd = 1
            pfd = 1
            prd = 1
            combatLog.text = "The adrenaline is coursing through your veins! You feel like you are going to throw up and your hands are shaking! You are terrified!"
        }
        if randomEnemy == 1 {
            opponentType = "newbie"
            backgroundText.text = "You size up your opponent. He appears clumsy and unskilled. He looks like he can barely even swing the club he has in his hands!"
            enemySwingDamage = 2
            enemyRiposteDamage = 1
            enemyFientDamage = 1
        } else if randomEnemy == 2 {
            opponentType = "clever"
            backgroundText.text = "You size up your opponent. He appears clever but not very quick. He swings his katana well but his footwork is dazzling."
            enemySwingDamage = 1
            enemyRiposteDamage = 1
            enemyFientDamage = 2
            
        } else {
            opponentType = "master"
            backgroundText.text = "You size up your opponent. You begin to sweat when you see your opponent. He appears strong, quick, and clever. You see no weaknesses in him. "
            enemySwingDamage = 1
            enemyRiposteDamage = 1
            enemyFientDamage = 1
        }
    }
    
    
    
    
    func makeOpponentSelection() -> String {
        
        var option: [String] = []
        if opponentType == "newbie" {
            option.append("Swing")
            let randomNumber = Int(arc4random_uniform(1))
            return option[randomNumber]
            
        } else if opponentType == "clever" {
            option.append("Swing")
            option.append("Feint")
            let randomNumber = Int(arc4random_uniform(2))
            return option[randomNumber]
            
        } else {
            option.append("Swing")
            option.append("Feint")
            option.append("Riposte")
            let randomNumber = Int(arc4random_uniform(3))
            return option[randomNumber]
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
