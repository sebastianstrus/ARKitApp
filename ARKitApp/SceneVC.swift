//
//  SceneVC
//  ARKitApp
//
//  Created by Sebastian Strus on 2018-06-07.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class SceneVC: UIViewController, ARSCNViewDelegate {

    //recive info from Segue
    var textOnScene: String?
    var pVector: SCNVector3?
    var sVector: SCNVector3?
    var textColor: UIColor?
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //create a Text Geometry, Assignsthe text that I want to display and gives some thickness to my 3D text
        let text = SCNText(string: textOnScene, extrusionDepth: 1)
        
        //create a material object
        let material = SCNMaterial()
        //set the material to blue colot
        material.diffuse.contents = textColor
        //assigns the material to my text
        text.materials = [material]
        
        //create a node object
        let node = SCNNode()
        //sets the position of this node
        node.position = pVector!
        //sets the size of the text
        node.scale = sVector!
        //sets the text geometry to the node object
        node.geometry = text
        
        //Adds the node to the sceneView
        sceneView.scene.rootNode.addChildNode(node)
        //Enables ightning to display shadows
        sceneView.automaticallyUpdatesLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
