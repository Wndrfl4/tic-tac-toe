//
//  ViewController.swift
//  xandziro
//
//  Created by Aslan  on 04.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1
    
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func game(_ sender: UIButton) {
        print (sender.tag)
        
        var isDraw = true
        
        if arrayBoard[sender.tag - 1] != 0 {
            return
        }
        
        arrayBoard[sender.tag - 1] = player
        
        if player == 1{
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage(named: "zero"), for: .normal)
            player = 1
        }
        for win in winArray{
            if arrayBoard [win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 1{
                print("X win")
                
                let alert = UIAlertController(title: "X win", message: "X Win", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {UIAlertAction in
                    self.clearBoard()
                }))
                
                present(alert, animated: true)
            } else if arrayBoard [win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 2 {
                
                print("O win")
                
                let alert2 = UIAlertController(title: "0 win", message: "0 Win", preferredStyle: .alert)
                
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: {UIAlertAction in
                    self.clearBoard()
                }))
                
                present(alert2, animated: true)
                
            }
            
            
        }
    
        for cell in arrayBoard {
            if cell == 0 {
                isDraw = false
                break
            }
        }
            
        if isDraw {
            let alert3 = UIAlertController(title: "Ничья", message: "Это ничья!", preferredStyle: .alert)
            alert3.addAction(UIAlertAction(title: "Ok", style: .default, handler: {UIAlertAction in
                self.clearBoard()
            }))
            present(alert3, animated: true)
        }
            
        }
        
        func clearBoard(){
            for i in 0...8 {
                let button = view.viewWithTag(i+1) as! UIButton
                button.setBackgroundImage(nil, for: .normal)
                
                arrayBoard[i] = 0
            }
            player = 1
        }
    
    
        
    }
    

