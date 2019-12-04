//
//  ViewController.swift
//  Coding Test
//
//  Created by Sindhura on 25/11/19.
//  Copyright © 2019 Compindia . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var radiusView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radiusView.setCornerRadius(radius: self.radiusView.frame.height/2)
//        testing 12
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
       
//        print(CGFloat(self.radiusView.frame.width/100) * sender.value)
        self.radiusView.setBoarderWidth(boarderWidth: CGFloat(sender.value))
        
    }
    
    //Find Duplicate pairs
    func sockMerchant(n: Int, ar: [Int]) -> Int {
        var number = 0
        var constant = 0
        let uniqueArray = Array(Set(ar))
        
        for i in 0...(uniqueArray.count - 1) {
            for j in 0...(n-1) {
                if (uniqueArray[i] == ar[j]) {
                    number = number + 1
                }
            }
            if !(number % 2 == 0) {
                constant = constant + 1
            }
            number = 0
        }
        return (n - constant)/2
    }
    
    // Complete the countingValleys function below.
    func countingValleys(n: Int, s: String) -> Int {
        var sum = 0
        var vallyCount = 0
        var isUInitial = false
        let temp : [String] = Array(s).compactMap { return String($0) }
        for i in 0...(temp.count - 1) {
            isUInitial = temp[i] == "U" ? true : false
            if i+1 <= temp.count {
                for _ in i...i+1 {
                    if temp[i] == "U" {
                        sum = sum + 1
                    } else if temp[i] == "D"{
                        sum = sum - 1
                    }
                }
            }
            if sum == 0 && isUInitial {
                vallyCount = vallyCount + 1
            }
        }
        return vallyCount
    }
    
    //Shortest paths
    func jumpingOnClouds(c: [Int]) -> Int {
        var jumps: Int = 0
        let first = c[0]
        let last = (c.count - 1)
        let seq = sequence(first: first, next: { c[first] == c[$0 + ($0 == last - 1 ?  1 : 2) ] ? ($0+2) : ($0+1) }).prefix(while: { $0 <= last - 1 } )
        for i in seq {
            if c[first] == c[i] {
                jumps = jumps + 1
            }
        }
        return jumps
    }
    
    // Complete the repeatedString function below.
    func repeatedString(s: String, n: Int) -> Int {


        return 0
    }
   
}

struct Address {
  var fullAddress: String
  var city: String
  
  init(fullAddress: String, city: String) {
    self.fullAddress = fullAddress
    self.city = city
  }
}

class Person {
  var name: String
  var address: Address
  
  init(name: String, address: Address) {
    self.name = name
    self.address = address
  }
}


extension UIView {
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBoarderWidth(boarderWidth: CGFloat) {
        self.layer.borderWidth = boarderWidth
    }
}

