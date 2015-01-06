fixMozillaZIndex=true; //Fixes Z-Index problem  with Mozilla browsers but causes odd scrolling problem, toggle to see if it helps
_menuCloseDelay=500;
_menuOpenDelay=150;
_subOffsetTop=2;
_subOffsetLeft=-2;
with(contextStyle=new mm_style()){
bordercolor="#999999";
borderstyle="solid";
borderwidth=1;
fontfamily="arial, verdana, tahoma";
fontsize="75%";
fontstyle="normal";
headerbgcolor="#4F8EB6";
headerborder=1;
headercolor="#ffffff";
offbgcolor="#ffffff";
offcolor="#000000";
onbgcolor="#ECF4F9";
onborder="1px solid #316AC5";
oncolor="#000000";
outfilter="randomdissolve(duration=0.4)";
overfilter="Fade(duration=0.2);Shadow(color=#777777', Direction=135, Strength=3)";
padding=3;
pagebgcolor="#eeeeee";
pageborder="1px solid #ffffff";
pageimage="http://img.milonic.com/db_red.gif";
separatorcolor="#999999";
subimage="http://img.milonic.com/black_13x13_greyboxed.gif";
}

with(milonic=new menuname("contextMenu")){
margin=3;
style=contextStyle;
top="offset=2";
aI("image=images/right_menu_icon/edit.png;text=Test");
aI("image=images/right_menu_icon/download.png;separatorsize=1;text=Download;url=javascript:window.print();");
aI("image=images/right_menu_icon/edit.png;text=Edit;url=javascript:history.go(-1);");
aI("image=images/right_menu_icon/louck.png;text=Lock;url=javascript:history.go(1);");
aI("image=images/right_menu_icon/unlock.png;text=Unlock;url=javascript:history.go(0);");
aI("image=images/right_menu_icon/edit.png;text=Delete;url=javascript:history.go(-1);");
aI("image=images/right_menu_icon/rename.png;text=Rename;url=javascript:history.go(1);");
aI("image=images/right_menu_icon/add_document.png;text=Add Document;url=javascript:history.go(-1);");
aI("image=images/right_menu_icon/add_none.png;text=Add Note;url=javascript:history.go(-1);");
aI("image=images/right_menu_icon/add_key_word.png;text=Add Keyword;url=javascript:history.go(1);");

}

with(milonic=new menuname("Context Menu Samples")){
itemwidth=227;
margin=3;
overflow="scroll";
style=contextStyle;
aI("text=Menu 1")
aI("text=Menu 1")
aI("text=Menu 3")
aI("text=Menu 4")
aI("text=Menu 5")
aI("text=Menu 6")
aI("text=Menu 7")
aI("text=Menu 8")
aI("text=Menu 9")
}

drawMenus();

