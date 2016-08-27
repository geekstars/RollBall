//
//  ViewController.swift
//  RunningBall
//
//  Created by Hoàng Minh Thành on 8/26/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    func addBall() {
        ball = UIImageView(image:UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(32.0,screenSize.height/2)
        self.view.addSubview(ball)
    }
    var huong:Int = 0
    func rollBall()
    {
        let deltaAngle:CGFloat = 0.1
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
            if huong == 0
            {
                if (ball.center.x > 28 && ball.center.y > 28) && (ball.center.x <= screenSize.width - 32.0 && ball.center.y <= screenSize.height - 32)
                {
                    ball.center = CGPointMake(ball.center.x+ballRadious*deltaAngle, ball.center.y)
                }
                else
                {
                    let array = [3,4,5,6,7]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            //Xuong phai
            if huong == 1
            {
                if (ball.center.x >= 32 && ball.center.y >= 32.0) && (ball.center.x <= screenSize.width - 32.0 && ball.center.y < screenSize.height - 32)
                {
                    ball.center = CGPointMake(ball.center.x+ballRadious*deltaAngle, ball.center.y+ballRadious*deltaAngle)
                }
                else
                {
                    let array = [5,2,6,4,3]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            // Len phai
            if huong == 2
            {
                if (ball.center.x > 32 && ball.center.y <= screenSize.height - 31) && (ball.center.x < screenSize.width-32 && ball.center.y > 32)
                {
                    ball.center = CGPointMake(ball.center.x+ballRadious*deltaAngle, ball.center.y-ballRadious*deltaAngle)
                }
                else
                {
                    let array = [7,1,4,5,3]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }

            // Sang trai
            if huong == 3
            {
                if (ball.center.x < screenSize.width - 30 && ball.center.y <= screenSize.height - 32) && (ball.center.x >= 32 && ball.center.y >= 32)
                {
                    ball.center = CGPointMake(ball.center.x-ballRadious*deltaAngle, ball.center.y)
                }
                else
                {
                    let array = [1,2,0,6,7]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            //Xuong trai
            if huong == 4
            {
                if(ball.center.x < screenSize.width - 30 && ball.center.y <= screenSize.height - 32) && (ball.center.x > 30 && ball.center.y > 25)
                {
                    ball.center = CGPointMake(ball.center.x-ballRadious*deltaAngle, ball.center.y+ballRadious*deltaAngle)
                }
                else
                {
                    let array = [6,5,2,1]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            //Len trai
            if huong == 5
            {
                if ball.center.x < screenSize.width - 30 && ball.center.y <= screenSize.height - 30 && ball.center.x > 32 && ball.center.y > 30
                {
                    ball.center = CGPointMake(ball.center.x-ballRadious*deltaAngle, ball.center.y-ballRadious*deltaAngle)
                }
                else
                {
                    let array = [7,4,1,0,2]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            
            // Len
            if huong == 6
            {
                if ball.center.x > 32 && ball.center.y < screenSize.height - 31 && ball.center.y > 28 && ball.center.x < screenSize.width - 32
                {
                    ball.center = CGPointMake(ball.center.x, ball.center.y-ballRadious*deltaAngle)
                }
                else
                {
                    let array = [7,4,1,0,3]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]
                }
            }
            //Xuong
            if huong == 7
            {
                if (ball.center.x >= 32 && ball.center.y <= screenSize.height - 32) && (ball.center.y > 28)
                {
                    ball.center = CGPointMake(ball.center.x, ball.center.y+ballRadious*deltaAngle)
                }
                else
                {
                    let array = [6,5,2,0,3]
                    huong = array[Int(arc4random_uniform(UInt32(array.count)))]

                }
            }
    }
}

