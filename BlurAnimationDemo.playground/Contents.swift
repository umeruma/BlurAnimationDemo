import UIKit

class BlurAnimViewController: UIViewController {
    let imageView = UIImageView()
    
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    var anim: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        effectView.frame = view.frame
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(effectView)
        
        anim = UIViewPropertyAnimator(duration: 10, curve: .linear) {
            self.effectView.effect = nil
        }
        // MARK: - Run animation for fractionComplete
        anim?.startAnimation()
        anim?.pauseAnimation()
        anim?.fractionComplete = 0.6
        self.effectView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseInOut, animations: {
            self.effectView.alpha = 1
        }, completion: { (comp) in
            print("Animation END")
        })
    }
}

let vc = BlurAnimViewController()

vc.imageView.image = #imageLiteral(resourceName: "Splatoon.png")

import PlaygroundSupport
PlaygroundPage.current.liveView = vc

