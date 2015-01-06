package edms.chatdwr;

import java.util.ArrayList;
import java.util.Collection;

import org.directwebremoting.Browser;
import org.directwebremoting.Container;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.directwebremoting.ScriptSessions;
import org.directwebremoting.ServerContext;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.extend.ScriptSessionManager;
import org.directwebremoting.proxy.dwr.Util;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.SmackException.NoResponseException;
import org.jivesoftware.smack.SmackException.NotConnectedException;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException.XMPPErrorException;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smackx.pubsub.PresenceState;
import org.jivesoftware.smackx.vcardtemp.packet.VCard;

public class ReverseClass1 {

	public void createRoster(XMPPConnection xmppConnection2, String loggedUser,
			final String imageUrl) {
		String page = null;
		Container container = ServerContextFactory.get().getContainer();
		ScriptSessionManager manager = container
				.getBean(ScriptSessionManager.class);
		Collection<ScriptSession> allSessions = manager.getAllScriptSessions();
		for (ScriptSession ss : allSessions) {
			System.out.println("in for ^^^^^^^^^^^^ "
					+ ss.getAttribute("scriptAttribute"));
			if (ss.getAttribute("scriptAttribute").equals(loggedUser)) {
				page = ss.getPage();
				System.out.println("page ^^^^^^^^^^^ " + ss.getPage());
				break;
			}
		}
		ScriptSessionFilter filter = new TestScriptSessionFilter(
				"scriptAttribute", loggedUser);
		final XMPPConnection xmppConnection = xmppConnection2;
		Browser.withPageFiltered(page, filter, new Runnable() {

			@Override
			public void run() {
				Roster roster = xmppConnection.getRoster();
				Collection<RosterEntry> entries = roster.getEntries();
				System.out.println("reverse ROSTER SIZE=" + entries.size());
				Presence presence;
				String addDivs = "";
				String pendDivs = "";
				String frndreqDivs = "";
				VCard card = new VCard();
				for (RosterEntry re : entries) {
					System.out.println("REVERSE Buddy=" + re.getName()
							+ " user=" + re.getUser() + " status="
							+ re.getStatus() + " type=" + re.getType());
					String user = re.getUser();
					String imagesrc = imageUrl + user + ".jpg";

					presence = roster.getPresence(user);
					RosterPacket.ItemType type = re.getType();
					if (re.getStatus() == null
							&& type == RosterPacket.ItemType.both) {
						try {
							card.load(xmppConnection, re.getUser()); // load Buddy's VCard
						} catch (NoResponseException e) {
							e.printStackTrace();
						} catch (XMPPErrorException e) {
							e.printStackTrace();
						} catch (NotConnectedException e) {
							e.printStackTrace();
						}
						if (presence.getType() == Presence.Type.available) {
							Presence.Mode mode = presence.getMode();
							if (mode == Presence.Mode.available || mode == null) {
								String image = "online_file.png";
								if (presence.getStatus() != null) {
									addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
											+ imagesrc
											+ "' onerror='getAltImage(this.id)' id='"
											+ user
											+ "noimage' /></div>"
											+ "<div class='contact_information'><a href='#' id='"
											+ user
											+ "name' onclick='getChatBox(this.id)'>"
											+ "<p><strong>"
											+ card.getFirstName()
											+ " "
											+ card.getLastName()
											+ "</strong><br/></p>"
											+ "<p id='"
											+ user
											+ "status' style='margin-left: -94px; margin-top: 14px;' >"
											+ presence.getStatus()
											+ "</p></a></div>"
											+ "<div class='online_file' id='"
											+ user
											+ "' ><img src='images/"
											+ image + "' id='"+user+"presence' /></div></div>";
								} else {
									addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
											+ imagesrc
											+ "' onerror='getAltImage(this.id)' id='"
											+ user
											+ "noimage' /></div>"
											+ "<div class='contact_information'><a href='#' id='"
											+ user
											+ "name' onclick='getChatBox(this.id)'>"
											+ "<p><strong>"
											+ card.getFirstName()
											+ " "
											+ card.getLastName()
											+ "</strong><br/></p>"
											+ "<p id='"
											+ user
											+ "status' style='margin-left: -94px; margin-top: 14px;' ></p></a></div>"
											+ "<div class='online_file' id='"
											+ user
											+ "' ><img src='images/"
											+ image + "' id='"+user+"presence' /></div></div>";
								}
							}
							if (mode == Presence.Mode.away) {
								String image = "bullet_orange.png";
								addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
										+ imagesrc
										+ "' onerror='getAltImage(this.id)' id='"
										+ user
										+ "noimage' /></div>"
										+ "<div class='contact_information'><a href='#' id='"
										+ user
										+ "name' onclick='getChatBox(this.id)'>"
										+ "<p><strong>"
										+ card.getFirstName()
										+ " "
										+ card.getLastName()
										+ "</strong><br/></p>"
										+ "<p id='"
										+ user
										+ "status' style='margin-left: -94px; margin-top: 14px;' >"
										+ presence.getStatus()
										+ "</p></a></div>"
										+ "<div class='online_file' id='"
										+ user
										+ "' ><img src='images/"
										+ image
										+ "' id='"+user+"presence' /></div></div>";
							}
							if (mode == Presence.Mode.dnd) {
								String image = "bullet_red.png";
								addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
										+ imagesrc
										+ "' onerror='getAltImage(this.id)' id='"
										+ user
										+ "noimage' /></div>"
										+ "<div class='contact_information'><a href='#' id='"
										+ user
										+ "name' onclick='getChatBox(this.id)'>"
										+ "<p><strong>"
										+ card.getFirstName()
										+ " "
										+ card.getLastName()
										+ "</strong><br/></p>"
										+ "<p id='"
										+ user
										+ "status' style='margin-left: -94px; margin-top: 14px;' >"
										+ presence.getStatus()
										+ "</p></a></div>"
										+ "<div class='online_file' id='"
										+ user
										+ "' ><img src='images/"
										+ image
										+ "' id='"+user+"presence' /></div></div>";
							}
						} else {
							String image = "off_line.png";
							if (presence.getStatus() != null) {
								addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
										+ imagesrc
										+ "' onerror='getAltImage(this.id)' id='"
										+ user
										+ "noimage' /></div>"
										+ "<div class='contact_information'><a href='#' id='"
										+ user
										+ "name' onclick='getChatBox(this.id)'>"
										+ "<p><strong>"
										+ card.getFirstName()
										+ " "
										+ card.getLastName()
										+ "</strong><br/></p>"
										+ "<p id='"
										+ user
										+ "status' style='margin-left: -94px; margin-top: 14px;' >"
										+ presence.getStatus()
										+ "</p></a></div>"
										+ "<div class='online_file' id='"
										+ user
										+ "' ><img src='images/"
										+ image
										+ "' id='"+user+"presence' /></div></div>";
							} else {
								addDivs += "<div class='cheat_row'><div class='small_images'><img src='"
										+ imagesrc
										+ "' onerror='getAltImage(this.id)' id='"
										+ user
										+ "noimage' /></div>"
										+ "<div class='contact_information'><a href='#' id='"
										+ user
										+ "name' onclick='getChatBox(this.id)'>"
										+ "<p><strong>"
										+ card.getFirstName()
										+ " "
										+ card.getLastName()
										+ "</strong><br/></p>"
										+ "<p id='"
										+ user
										+ "status' style='margin-left: -94px; margin-top: 14px;' ></p></a></div>"
										+ "<div class='online_file' id='"
										+ user
										+ "' ><img src='images/"
										+ image
										+ "' id='"+user+"presence' /></div></div>";
							}
						}
					} else if (re.getStatus() == null
							&& (type == RosterPacket.ItemType.none || type == RosterPacket.ItemType.to)) {
						frndreqDivs += "<div class='cheat_row' style='margin-bottom: 10px;'>"
								+ "<div class='contact_information'><a href='#' id='"
								+ user
								+ "name' ><p><strong>"
								+ user
								+ "</strong><br/></p></a></div>"
								+ "<div class='online_file' >"
								+ "<input type='button' value='Accept' onclick='friendRequest(this.id)' id='"
								+ user
								+ "acceptbtn' style='margin-left: -56px;'/></div>"
								+"<input type='button' value='Deny' onclick='friendDeny(this.id)' id='"+user+"denybtn'"
										+ " style='margin-left: -56px; margin-top: 25px;'/></div>";
					} else {
						pendDivs += "<div class='cheat_row' style='margin-bottom: -16px;'>"
								+ "<div class='contact_information'><a href='#' id='"
								+ user
								+ "name' ><p><strong>"
								+ user
								+ "</strong><br/></p></a></div>" + "</div>";
					}
				}
				addDivs += frndreqDivs + pendDivs;
				ScriptSessions.addFunctionCall("createChatRow", addDivs);
			}
		});
	}

	public void updatePresence(ServerContext serverContext, Presence presence) {
		String[] divid = presence.getFrom().split("/");
		String[] name = presence.getFrom().split("@");
		String avlblid = name[0] + "avlblimg";
		String statusid = divid[0] + "status";
		System.out.println("page==========" + serverContext.getContextPath());
		String currentPage = serverContext.getContextPath() + "/userChat";
		Collection sessions = serverContext
				.getScriptSessionsByPage(currentPage);
		Util utilAll = new Util(sessions);
		if (presence.isAvailable()) {
			Presence.Mode mode = presence.getMode();
			System.out
					.println(presence.getFrom()
							+ " is available=========================================== mode="
							+ mode);
			if (mode == Presence.Mode.available || mode == null) {
				utilAll.setValue(divid[0], "<img src='images/online_file.png' id='"+divid[0]+"presence' >");
				utilAll.setValue(
						avlblid,
						"<img src='images/online_file.png' style='margin-left: 2px;margin-right: 4px;' />");
				utilAll.setValue(statusid, presence.getStatus());
			} else if (mode == Presence.Mode.away) {
				utilAll.setValue(divid[0],
						"<img src='images/bullet_orange.png' id='"+divid[0]+"presence' >");
				utilAll.setValue(
						avlblid,
						"<img src='images/bullet_orange.png' style='margin-left: 2px;margin-right: 4px;' />");
				utilAll.setValue(statusid, presence.getStatus());
			} else if (mode == Presence.Mode.dnd) {
				utilAll.setValue(divid[0], "<img src='images/bullet_red.png' id='"+divid[0]+"presence' >");
				utilAll.setValue(
						avlblid,
						"<img src='images/bullet_red.png' style='margin-left: 2px;margin-right: 4px;' />");
				utilAll.setValue(statusid, presence.getStatus());
			}
		} else {
			utilAll.setValue(divid[0], "<img src='images/off_line.png' id='"+divid[0]+"presence' >");
			utilAll.setValue(avlblid,
					"<img src='images/off_line.png' style='margin-left: 2px;margin-right: 4px;' />");
			utilAll.setValue(statusid, presence.getStatus());
		}
	}

	public void listeningForMessages(Message message) {
		String from = message.getFrom();
		final String newmsg = message.getBody();
		final String[] name = from.split("@");
		final String[] nameid = from.split("/");
		String page = null;
		Container container = ServerContextFactory.get().getContainer();
		ScriptSessionManager manager = container
				.getBean(ScriptSessionManager.class);
		Collection<ScriptSession> allSessions = manager.getAllScriptSessions();
		String[] msgTo = message.getTo().split("/");
		System.out.println("script session size=" + allSessions.size());
		for (ScriptSession ss : allSessions) {
			if (ss != null && ss.getAttribute("scriptAttribute") != null) {
				System.out.println("in for ^^^^^^^^^^^^ "
						+ ss.getAttribute("scriptAttribute") + " to "
						+ msgTo[0]);
				if (ss.getAttribute("scriptAttribute").equals(msgTo[0])) {
					page = ss.getPage();
					System.out.println("page ^^^^^^^^^^^ " + ss.getPage());
					break;
				}
			}
		}
		ScriptSessionFilter filter = new TestScriptSessionFilter(
				"scriptAttribute", msgTo[0]);
		Browser.withPageFiltered(page, filter, new Runnable() {

			@Override
			public void run() {
				System.out.println("in run message ^^^^^^^^^^^^^^^^^");
				if (newmsg != null) {
					String msgarrived = "<div class='ui-chatbox-msg' style='float:right'><p><b>"
							+ name[0] + " : </b>" + newmsg + "</p></div>";
					String id = name[0] + "typing";
					ScriptSessions.addFunctionCall("removeLastAppended", id);
					ArrayList<String> msglist = new ArrayList<String>();
					msglist.add(name[0]);
					msglist.add(msgarrived);
					msglist.add(nameid[0]);
					ScriptSessions.addFunctionCall("updateChatBox", msglist);
				} else {
					String typeid = name[0] + "typing";
					String typing = "<div id='"
							+ typeid
							+ "' class='ui-chatbox-msg'><p style='bottom: 69px;position: fixed;'><b>Typing..</b></p></div>";
					ArrayList<String> msglist = new ArrayList<String>();
					msglist.add(name[0]);
					msglist.add(typing);
					msglist.add(nameid[0]);
					ScriptSessions.addFunctionCall("updateChatBox", msglist);
				}
			}
		});
	}
}
