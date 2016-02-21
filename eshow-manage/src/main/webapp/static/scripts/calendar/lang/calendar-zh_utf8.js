// ** I18N

// Calendar EN language
// Author: Mihai Bazon, <mihai_bazon@yahoo.com>
// Encoding: any
// Distributed under the same terms as the calendar itself.

// For translators: please use UTF-8 if possible.  We strongly believe that
// Unicode is the answer to a real internationalized world.  Also please
// include your contact information in the header, as can be seen above.

// full day names
Calendar._DN = new Array
("\u5468\u65e5",//\u5468\u65e5
 "\u5468\u4e00",//\u5468\u4e00
 "\u5468\u4e8c",//\u5468\u4e8c
 "\u5468\u4e09",//\u5468\u4e09
 "\u5468\u56db",//\u5468\u56db
 "\u5468\u4e94",//\u5468\u4e94
 "\u5468\u516d",//\u5468\u516d
 "\u5468\u65e5");//\u5468\u65e5

/*
("Sunday",
 "Monday",
 "Tuesday",
 "Wednesday",
 "Thursday",
 "Friday",
 "Saturday",
 "Sunday");
*/

// Please note that the following array of short day names (and the same goes
// for short month names, _SMN) isn't absolutely necessary.  We give it here
// for exemplification on how one can customize the short day names, but if
// they are simply the first N letters of the full name you can simply say:
//
//   Calendar._SDN_len = N; // short day name length
//   Calendar._SMN_len = N; // short month name length
//
// If N = 3 then this is not needed either since we assume a value of 3 if not
// present, to be compatible with translation files that were written before
// this feature.

// short day names
Calendar._SDN = new Array
("\u65e5",//\u5468\u65e5
 "\u4e00",//\u5468\u4e00
 "\u4e8c",//\u5468\u4e8c
 "\u4e09",//\u5468\u4e09
 "\u56db",//\u5468\u56db
 "\u4e94",//\u5468\u4e94
 "\u516d",//\u5468\u516d
 "\u65e5");//\u5468\u65e5

/*
("Sun",
 "Mon",
 "Tue",
 "Wed",
 "Thu",
 "Fri",
 "Sat",
 "Sun");
*/


// First day of the week. "0" means display Sunday first, "1" means display
// Monday first, etc.
Calendar._FD = 0;

// full month names
Calendar._MN = new Array
("\u4e00\u6708",
 "\u4e8c\u6708",
 "\u4e09\u6708",
 "\u56db\u6708",
 "\u4e94\u6708",
 "\u516d\u6708",
 "\u4e03\u6708",
 "\u516b\u6708",
 "\u4e5d\u6708",
 "\u5341\u6708",
 "\u5341\u4e00\u6708",
 "\u5341\u4e8c\u6708");

/*
("January",
 "February",
 "March",
 "April",
 "May",
 "June",
 "July",
 "August",
 "September",
 "October",
 "November",
 "December");
*/

// short month names
Calendar._SMN = new Array
("\u4e00\u6708",
 "\u4e8c\u6708",
 "\u4e09\u6708",
 "\u56db\u6708",
 "\u4e94\u6708",
 "\u516d\u6708",
 "\u4e03\u6708",
 "\u516b\u6708",
 "\u4e5d\u6708",
 "\u5341\u6708",
 "\u5341\u4e00\u6708",
 "\u5341\u4e8c\u6708");

/*
("Jan",
 "Feb",
 "Mar",
 "Apr",
 "May",
 "Jun",
 "Jul",
 "Aug",
 "Sep",
 "Oct",
 "Nov",
 "Dec");
*/

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "About the calendar";

Calendar._TT["ABOUT"] =
//"DHTML Date/Time Selector\n" +
//"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" + // don't translate this this ;-)
//"For latest version visit: http://www.dynarch.com/projects/calendar/\n" +
//"Distributed under GNU LGPL.  See http://gnu.org/licenses/lgpl.html for details." +
//"\n\n" +
//"Date selection:\n" +
//"- Use the \xab, \xbb buttons to select year\n" +
//"- Use the " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " buttons to select month\n" +
//"- Hold mouse button on any of the above buttons for faster selection.";
//Calendar._TT["ABOUT_TIME"] = "\n\n" +
//"Time selection:\n" +
//"- Click on any of the time parts to increase it\n" +
//"- or Shift-click to decrease it\n" +
//"- or click and drag for faster selection.";

"\u65e5\u671f\u9009\u62e9:\n" +
"- \u70b9\u51fb\xab(\xbb)\u6309\u94ae\u9009\u62e9\u4e0a(\u4e0b)\u4e00\u5e74\u5ea6.\n" +
"- \u70b9\u51fb" + String.fromCharCode(0x2039) + "(" + String.fromCharCode(0x203a) + ")\u6309\u94ae\u9009\u62e9\u4e0a(\u4e0b)\u4e2a\u6708\u4efd.\n" +
"- \u957f\u65f6\u95f4\u6309\u7740\u6309\u94ae\u5c06\u51fa\u73b0\u66f4\u591a\u9009\u62e9\u9879.";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"\u65f6\u95f4\u9009\u62e9:\n" +
"-\u5728\u65f6\u95f4\u90e8\u5206(\u5206\u6216\u8005\u79d2)\u4e0a\u5355\u51fb\u9f20\u6807\u5de6\u952e\u6765\u589e\u52a0\u5f53\u524d\u65f6\u95f4\u90e8\u5206(\u5206\u6216\u8005\u79d2)\n" +
"-\u5728\u65f6\u95f4\u90e8\u5206(\u5206\u6216\u8005\u79d2)\u4e0a\u6309\u4f4fShift\u952e\u540e\u5355\u51fb\u9f20\u6807\u5de6\u952e\u6765\u51cf\u5c11\u5f53\u524d\u65f6\u95f4\u90e8\u5206(\u5206\u6216\u8005\u79d2).";



//Calendar._TT["PREV_YEAR"] = "Prev. year (hold for menu)";
//Calendar._TT["PREV_MONTH"] = "Prev. month (hold for menu)";
//Calendar._TT["GO_TODAY"] = "Go Today";
//Calendar._TT["NEXT_MONTH"] = "Next month (hold for menu)";
//Calendar._TT["NEXT_YEAR"] = "Next year (hold for menu)";
//Calendar._TT["SEL_DATE"] = "Select date";
//Calendar._TT["DRAG_TO_MOVE"] = "Drag to move";
//Calendar._TT["PART_TODAY"] = " (today)";

Calendar._TT["PREV_YEAR"] = "\u4e0a\u4e00\u5e74";
Calendar._TT["PREV_MONTH"] = "\u4e0a\u4e2a\u6708";
Calendar._TT["GO_TODAY"] = "\u5230\u4eca\u5929";
Calendar._TT["GO_CLEAR"] = "\u6e05\u7a7a";
Calendar._TT["NEXT_MONTH"] = "\u4e0b\u4e2a\u6708";
Calendar._TT["NEXT_YEAR"] = "\u4e0b\u4e00\u5e74";
Calendar._TT["SEL_DATE"] = "\u9009\u62e9\u65e5\u671f";
Calendar._TT["DRAG_TO_MOVE"] = "\u62d6\u52a8";
Calendar._TT["PART_TODAY"] = " (\u4eca\u5929)";



// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
//Calendar._TT["DAY_FIRST"] = "Display %s first";
Calendar._TT["DAY_FIRST"] = "%s\u4e3a\u8fd9\u5468\u7684\u7b2c\u4e00\u5929";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

//Calendar._TT["CLOSE"] = "Close";
//Calendar._TT["TODAY"] = "Today";
//Calendar._TT["TIME_PART"] = "(Shift-)Click or drag to change value";

Calendar._TT["CLOSE"] = "\u5173\u95ed";
Calendar._TT["TODAY"] = "\u4eca\u5929";
Calendar._TT["CLEAR"] = "\u6e05\u7a7a";
Calendar._TT["TIME_PART"] = "(\u6309\u7740Shift\u952e)\u5355\u51fb\u6216\u62d6\u52a8\u6539\u53d8\u503c";


// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "%a, %b %e";

//Calendar._TT["WK"] = "wk";
//Calendar._TT["TIME"] = "Time:";

Calendar._TT["WK"] = "\u5468";
Calendar._TT["TIME"] = "\u65f6\u95f4:";