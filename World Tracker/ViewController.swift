//
//  ViewController.swift
//  World Tracker
//
//  Created by Lucia Adams on 6/4/23.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    // Restart the scene view to update the origin
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    // Generate a random  number between two numbers
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        
        // Path Example
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.4, y: 0))
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        
        // Capsule Example
        //node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        
        // Cone Example
        // node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.3)
        
        // Sphere Example
        // node.geometry = SCNSphere(radius: 0.3)
        
        // Torus Example
        //node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        
        // Plane Example
        //node.geometry = SCNPlane(width: 0.2, height: 0.2)
        
        // Pyramid Example
        // node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
        
        
        // Quad Example
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        
        // Set materials and colors
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        
        // Randomize position
        node.position = SCNVector3(x, y, z)
        
        // Static Position
        // node.position = SCNVector3(0, 0, -0.3)
        
        // Append the node to the rootnode of the scene
        self.sceneView.scene.rootNode.addChildNode(node)
    }
}

