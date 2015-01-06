package edms.chatdwr;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.directwebremoting.ServerContext;
import org.directwebremoting.ServerContextFactory;
import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ChatManager;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.ConnectionConfiguration.SecurityMode;
import org.jivesoftware.smack.ChatManagerListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.RosterListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.SmackException;
import org.jivesoftware.smack.SmackException.NoResponseException;
import org.jivesoftware.smack.SmackException.NotConnectedException;
import org.jivesoftware.smack.SmackException.NotLoggedInException;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.XMPPException.XMPPErrorException;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.jivesoftware.smackx.iqlast.LastActivityManager;
import org.jivesoftware.smackx.iqlast.packet.LastActivity;

public class XmppChatClass {

	private ServletContext servletContext;
	private XMPPConnection xmppConnection;
	private MessageListener messageListener;
	private Chat chat;

	private HashMap<String, Chat> activeChats = new HashMap<String, Chat>();

	public void createConnection(String xmppDomain, int packetReplyTimeout, HttpServletRequest request) {
		System.out.println("initializing connection to server" + xmppDomain);
		SmackConfiguration.setDefaultPacketReplyTimeout(packetReplyTimeout);
	
		// Create a configuration for the connection
		ConnectionConfiguration config = new ConnectionConfiguration(xmppDomain);
		// Set the TLS security mode used when making the connection.
		config.setSecurityMode(SecurityMode.enabled); 
		// The new connection about to be established is going to be debugged.
		//	config.setDebuggerEnabled(true); 	
		// Roster will be loaded from the server when logging in.
		config.setRosterLoadedAtLogin(true); 
		// Enable compression of XMPP packets.
		config.setCompressionEnabled(true); 
		// If a connected XMPPConnection gets disconnected abruptly, automatic reconnection is enabled.
		config.setReconnectionAllowed(true); 
				
		// Create a new XMPP connection object
		xmppConnection = new XMPPTCPConnection(config);
		try {
			// Connect to the server
			xmppConnection.connect();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("xmppConnection", xmppConnection);
			System.out.println("Connected to server............"+ xmppConnection.isConnected());
			System.out.println("connection id="+ xmppConnection.getConnectionID());
			System.out.println("is secure connection="+xmppConnection.isSecureConnection());
			System.out.println("host: "+xmppConnection.getHost()+"port: "+xmppConnection.getPort()+"service name: "+xmppConnection.getServiceName());
		} catch (NotConnectedException nce) {
			nce.printStackTrace();
		} catch (SmackException se) {
			se.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (XMPPException xme) {
			xme.printStackTrace();
		}
	}

	public void registerListeners(final String vcardImage) {
		System.out.println("in function with connection id="
				+ xmppConnection.getConnectionID());

		// Add a listener waiting for subscription packets
		xmppConnection.addPacketListener(new PacketListener() {

			@Override
			public void processPacket(Packet paramPacket)
					throws NotConnectedException {

				System.out.println("2 coonection id is %%%%%%%%%%% "
						+ xmppConnection.getConnectionID());

				if (paramPacket instanceof Presence) {
					Presence presence = (Presence) paramPacket;
					// check if the user is already on the roster
					final RosterEntry newEntry = xmppConnection.getRoster()
							.getEntry(presence.getFrom());

					System.out.println(presence.getFrom()
							+ " new entry in roster ?? " + newEntry + " type= "
							+ presence.getType());

					// subscribe to a new user
					if (presence.getType().equals(Presence.Type.subscribe)) {
						if (newEntry == null) {
							System.out.println("in if.........");
							System.out
									.println("roster mode 3 ++++++++++++++++++++ "
											+ xmppConnection.getRoster()
													.getSubscriptionMode());
							try {
								xmppConnection.getRoster().createEntry(
										presence.getFrom(), null, null);
							} catch (NotLoggedInException e) {
								e.printStackTrace();
							} catch (NoResponseException e) {
								e.printStackTrace();
							} catch (XMPPErrorException e) {
								e.printStackTrace();
							}
							System.out
									.println("@@@@@@@@@@@@@@@ Friend request roster entry created for "
											+ presence.getFrom());
						} else {
							System.out.println("in else........");
							System.out
									.println("roster mode 4 ++++++++++++++++++++ "
											+ xmppConnection.getRoster()
													.getSubscriptionMode());
							Presence againpresence = new Presence(
									Presence.Type.subscribed);
							againpresence.setMode(Presence.Mode.available);
							againpresence.setTo(presence.getFrom());
							xmppConnection.sendPacket(againpresence);
							System.out
									.println("subscribed sent to %%%%%%%%%%%%% "
											+ presence.getFrom());
						}
					}
				}
			}
		}, new PacketFilter() {

			@Override
			public boolean accept(Packet packet) {
				System.out.println("1 coonection id is %%%%%%%%%%% "
						+ xmppConnection.getConnectionID());
				if (packet instanceof Presence) {
					Presence presence = (Presence) packet;
					if (presence.getType().equals(Presence.Type.subscribed)
							|| presence.getType().equals(
									Presence.Type.subscribe)) {
						System.out.println("return true %%%%%%%%%%%%%% "
								+ presence.getType() + " from "
								+ presence.getFrom());
						return true;
					}
				}
				return false;
			}
		});

		// Retrieve the user's roster from XMPP server
		Roster roster = xmppConnection.getRoster();
		System.out.println("roster mode 1 ++++++++++++++++++++++ "
				+ roster.getSubscriptionMode());
		// switch subscription mode, default is automatic
		roster.setSubscriptionMode(Roster.SubscriptionMode.manual);
		System.out.println("roster mode manual *******************************");
		// add a listener in order to get updates on roster changes
		roster.addRosterListener(new RosterListener() {
			@Override
			public void presenceChanged(Presence presence) {
				System.out.println("Presence changed: ::::::::::::::::::: "
						+ presence.getFrom() + " " + presence);
				System.out.println("presence mode ::::::::::::::::::: "
						+ presence.getMode());
				System.out.println("presence type ::::::::::::: "
						+ presence.getType());			
				ServerContext serverContext = ServerContextFactory
						.get(servletContext);
				System.out.println("server context = "+serverContext);
				System.out.println("before update presence ^^^^^^^^^^^^^^^^^^^^^^^^^^");
				(new ReverseClass()).updatePresence(serverContext, presence);
			}

			@Override
			public void entriesUpdated(Collection<String> coll) {
				System.out.println("Entries Updated %%%%%%%%%%%%%%%%%%% "
						+ coll);
				(new ReverseClass()).createRoster(xmppConnection,
						xmppConnection.getUser().split("/")[0], vcardImage);
			}

			@Override
			public void entriesDeleted(Collection<String> arg0) {
				System.out.println("Entries Deleted %%%%%%%%%%%%%%%%%%%");
				(new ReverseClass()).createRoster(xmppConnection,
						xmppConnection.getUser().split("/")[0], vcardImage);
			}

			@Override
			public void entriesAdded(Collection<String> coll) {
				System.out.println("Entries Added %%%%%%%%%%%%%%% " + coll);
				(new ReverseClass()).createRoster(xmppConnection,
						xmppConnection.getUser().split("/")[0], vcardImage);
			}

		});
		
		//listen for connection closing and reconnection events.
		xmppConnection.addConnectionListener(new ConnectionListener() {
			
			@Override
			public void reconnectionSuccessful() {
				System.out.println("listener reconnection successful (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void reconnectionFailed(Exception e) {
				System.out.println("listener reconnectionFailed (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void reconnectingIn(int arg0) {
				System.out.println("listener reconnectingIn (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void connectionClosedOnError(Exception e) {
				System.out.println("listener connectionClosedOnError (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void connectionClosed() {
				System.out.println("listener connectionClosed (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void connected(XMPPConnection xmppConnection) {
				System.out.println("listener connected (((((((((((((((((((((((((((((((((((((");
			}
			
			@Override
			public void authenticated(XMPPConnection xmppConnection) {
				System.out.println("listener authenticated (((((((((((((((((((((((((((((((((((((");
			}
		});
		
		
		ChatManager.getInstanceFor(xmppConnection).addChatListener(
				new ChatManagerListener() {
					@Override
					public void chatCreated(Chat chat, boolean createdLocally) {
						System.out.println("created locally ******** "
								+ createdLocally);
						if (!createdLocally) {
							chat.addMessageListener(new MessageListener() {

								@Override
								public void processMessage(Chat chat, Message message) {
									System.out
											.println("Listener Received new msg="
													+ message.getBody()
													+ " from "
													+ message.getFrom()
													+ " to "
													+ message.getTo()
													+ " participant "
													+ chat.getParticipant());
									System.out
											.println("Listener message connection user="
													+ xmppConnection.getUser());
									System.out.println("thread id= "+chat.getThreadID());
									(new ReverseClass()).listeningForMessages(message);
								}
							});
						}
					}
				});
	}

	public void performLogin(String username, String password,
			String onlineStatus) {
		try {
			// login to the connected server
			xmppConnection.login(username, password);

			// Create the presence object with default availability
			Presence presence = new Presence(Presence.Type.available);
			// Set the status message
			presence.setStatus(onlineStatus);
			// Set the highest priority
			presence.setPriority(24);
			// Set available presence mode
			presence.setMode(Presence.Mode.available);
			// Send the presence packet through the connection
			xmppConnection.sendPacket(presence);
			/*LastActivityManager lacManager=LastActivityManager.getInstanceFor(xmppConnection);
			LastActivity activity = lacManager.getLastActivity("tanvi@silvereye.in/Smack");
			System.out.println("activity= "+activity.getIdleTime());*/

		} catch (NotConnectedException nce) {
			nce.printStackTrace();
		} catch (SmackException se) {
			se.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (XMPPException xme) {
			xme.printStackTrace();
		}
	}

	public void sendChatMessages(String message, String buddyJID) {
		System.out.println(xmppConnection.getConnectionID()
				+ " : Sending Message " + message + "from "
				+ xmppConnection.getUser() + " to buddy " + buddyJID);

		/*if (activeChats.containsKey(buddyJID)) {
			chat = activeChats.get(buddyJID);
		} else {*/
			chat = ChatManager.getInstanceFor(xmppConnection).createChat(
					buddyJID, messageListener);
			/*activeChats.put(buddyJID, chat);
		}*/
		try {
			System.out.println("==> send message start.. Thread id="
					+ chat.getThreadID());
			long t1 = System.currentTimeMillis();
			System.out.println("connected to server in msg="
					+ xmppConnection.isConnected());
			chat.sendMessage(message);
			long t2 = System.currentTimeMillis();
			System.out.println("time lag == " + (t2 - t1));
			System.out.println("==>send message ends");
			System.out.println(xmppConnection.getConnectionID()
					+ " : Message sent successfully");
		} catch (NotConnectedException e) {
			e.printStackTrace();
		} catch (XMPPException e) {
			e.printStackTrace();
		}
	}
	
	/*public void sendChatMessages(String message, String buddyJID) {
		System.out.println(xmppConnection.getConnectionID()
				+ " : Sending Message " + message + "from "
				+ xmppConnection.getUser() + " to buddy " + buddyJID);
		ChatManager chatManager= ChatManager.getInstanceFor(xmppConnection);
		Chat chat=chatManager.createChat(buddyJID, new MessageListener() {
			
			@Override
			public void processMessage(Chat chat, Message msg) {
				System.out.println("received message thread id= "+chat.getThreadID());
			}
		});
		try {
			System.out.println("==> send message start.. Thread id="
					+ chat.getThreadID());
			long t1 = System.currentTimeMillis();
			System.out.println("connected to server in msg="
					+ xmppConnection.isConnected());
			chat.sendMessage(message);
			long t2 = System.currentTimeMillis();
			System.out.println("time lag == " + (t2 - t1));
			System.out.println("==>send message ends");
			System.out.println(xmppConnection.getConnectionID()
					+ " : Message sent successfully");
		} catch (NotConnectedException e) {
			e.printStackTrace();
		} catch (XMPPException e) {
			e.printStackTrace();
		}
	}*/

	public void sendInvite(String address) {
		Presence invite = new Presence(Presence.Type.subscribe);
		invite.setTo(address);
		try {
			xmppConnection.sendPacket(invite);
			System.out.println("INVITE SENT SUCCESSFULLY to " + address
					+ "............");
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
	}

	public void acceptFrndReq(String from) {
		System.out.println("in accept friend request");
		// accept a subscription request defined by the PresenceObject
		// (originally received with the request)
		Presence newpresence = new Presence(Presence.Type.subscribed);
		newpresence.setTo(from);
		try {
			xmppConnection.sendPacket(newpresence);
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
		System.out
				.println("subscribed sent to in accept friend request %%%%%%%%%%%%% "
						+ from);

		Presence subscription = new Presence(Presence.Type.subscribe);
		subscription.setTo(from);
		try {
			xmppConnection.sendPacket(subscription);
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
		System.out
				.println("subscribe sent to in accept friend request %%%%%%%%%% "
						+ from);
	}
	
	/*public void denyFrndReq(String from) {
		Roster roster=xmppConnection.getRoster();
		RosterEntry entry = roster.getEntry(from);
		System.out.println("entry to be deleted "+entry.getUser());
		try {
			roster.removeEntry(entry);
			System.out.println("entry deleted !!");
		} catch (NotLoggedInException e) {
			e.printStackTrace();
		} catch (NoResponseException e) {
			e.printStackTrace();
		} catch (XMPPErrorException e) {
			e.printStackTrace();
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
	}*/
	
	public void denyFrndReq(String from) {
		System.out.println("in deny friend request");
		// reject a subscription request defined by the PresenceObject
		// (originally received with the request)
		Presence presence = new Presence(Presence.Type.unsubscribe);
		presence.setTo(from);
		try {
			xmppConnection.sendPacket(presence);
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
		System.out.println("unsubscribe sent to in deny friend request %%%%%%%%%%%%% "+ from);
		Roster roster=xmppConnection.getRoster();
		RosterEntry entry = roster.getEntry(from);
		System.out.println("entry to be deleted "+entry.getUser());
		try {
			roster.removeEntry(entry);
			System.out.println("entry deleted !!");
		} catch (NotLoggedInException e) {
			e.printStackTrace();
		} catch (NoResponseException e) {
			e.printStackTrace();
		} catch (XMPPErrorException e) {
			e.printStackTrace();
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		try {
			if (xmppConnection.isConnected()) {
				xmppConnection.disconnect(); // Disconnect from the server
				System.out.println("xmpp connection closed !");
			}
		} catch (NotConnectedException e) {
			e.printStackTrace();
		}
	}

	public void sendChangePresence(String mode, String onlineStatus,
			String awayStatus, String dndStatus) {
		if (mode.equals("online")) {
			Presence presence = new Presence(Presence.Type.available);
			presence.setStatus(onlineStatus);
			presence.setPriority(24);
			presence.setMode(Presence.Mode.available);
			try {
				xmppConnection.sendPacket(presence);
			} catch (NotConnectedException e) {
				e.printStackTrace();
			}
		}
		if (mode.equals("away")) {
			Presence presence = new Presence(Presence.Type.available);
			presence.setStatus(awayStatus);
			presence.setPriority(24);
			presence.setMode(Presence.Mode.away);
			try {
				xmppConnection.sendPacket(presence);
			} catch (NotConnectedException e) {
				e.printStackTrace();
			}
		}
		if (mode.equals("dnd")) {
			Presence presence = new Presence(Presence.Type.available);
			presence.setStatus(dndStatus);
			presence.setPriority(24);
			presence.setMode(Presence.Mode.dnd);
			try {
				xmppConnection.sendPacket(presence);
			} catch (NotConnectedException e) {
				e.printStackTrace();
			}
		}
		if (mode.equals("offline")) {
			Presence presence = new Presence(Presence.Type.unavailable);
			try {
				xmppConnection.sendPacket(presence);
			} catch (NotConnectedException e) {
				e.printStackTrace();
			}
		}
	}
}
