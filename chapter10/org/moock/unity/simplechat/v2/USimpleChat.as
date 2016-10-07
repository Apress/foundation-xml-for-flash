import org.moock.unity.*;

class org.moock.unity.simplechat.v2.USimpleChat
      extends UClient {

  /**
   * Constructor
   */
  public function USimpleChat (target:MovieClip, 
                          host:String, 
                          port:Number, 
                          configURL:String, 
                          disableLog:Boolean) {
    // Invoke UClient constructor.
    super(target, host, port, configURL, disableLog);
  }

  /**
   * SocketListener event handler
   */
  public function onClientReady ():Void {
    // Make a new room in the default namespace.
    getRoomManager().createRoomOnServer("chat", "udefault", false, false, 50, null);

    joinRoom("udefault.chat");

    // Display the user interface for this app.
    //getTargetMC().gotoAndStop("simpleChatInterface");
	getTargetMC().incoming.text = "Connected to chat room\n";
  }

  /**
   * RoomManagerListener event handler
   */
  public function onJoinNonExistentRoom (e:RoomManagerEvent):Void {
    var missingRoomID:String = e.getNamespaceID() + "." + e.getRoomID();
    trace("Room join failed. Room not found: " + missingRoomID);
  }

  /**
   * Takes user input from outgoing and sends it to all clients
   * in the room "udefault.chat".
   */
  public function sendMessage ():Void {
    // Only send the message if there's text
    // in the outgoing text field.
    if (getTargetMC().outgoing.text.length > 0) {
      // The message typed by the user.
      var msg:String = getTargetMC().outgoing.text;

      // The message we'll send to the server.
      var safeMsg:String = '<![CDATA[' + msg + ']]>';

      // Send the message to the server.
      invokeOnRoom("displayMessage", "udefault.chat", true, safeMsg);

      // Clear the user input text field.
      getTargetMC().outgoing.text = "";
    }
  }

  /**
   * Displays text sent by a client.
   */
  public function displayMessage (clientID:String, msg:String):Void {
    getTargetMC().incoming.text += "User" + clientID + ": " + msg + "\n";
    getTargetMC().incoming.vPosition = getTargetMC().incoming.maxVPosition;
  }

  /**
   * A string representation of this object.
   */
  public function toString ():String {
    return "A USimpleChat object";
  }
}

