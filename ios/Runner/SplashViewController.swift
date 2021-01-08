//  SplashViewController.swift

import UIKit
import Lottie

public class SplashViewController: UIViewController {
    
    private var animationView: AnimationView?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //Here in the name property you need to specify the name of your Lottie Animation json file
        animationView = .init(name: "spin_finity_loader")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1.00
 
        self.view.addSubview(animationView!)
       
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView!.play { (finished) in
            self.startFlutterApp()
        }
        
    }
    
    func startFlutterApp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let flutterEngine = appDelegate.flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
    
        flutterViewController.modalPresentationStyle = .custom
        flutterViewController.modalTransitionStyle = .crossDissolve
    
        present(flutterViewController, animated: true, completion: nil)
    }
    
}
