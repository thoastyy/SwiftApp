import Foundation

class TimerExample {
    var timer: Timer?

    init() {
        startTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            // This closure will be executed after 5 seconds
            print("Timer fired after 5 seconds!")
            
            // You can perform any action you want here
            
            // Don't forget to invalidate the timer to release resources
            timer.invalidate()
        }
    }
    
    // Make sure to invalidate the timer when it's no longer needed
    deinit {
        timer?.invalidate()
    }
}

// Create an instance of TimerExample
let example = TimerExample()
