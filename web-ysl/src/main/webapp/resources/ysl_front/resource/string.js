/**
 * string.js
 * @author Wendell
 * @version 1.0
 */
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

String.prototype.lTrim = function() {
	return this.replace(/(^\s*)/g, "");
}

String.prototype.rTrim = function() {
	return this.replace(/(\s*$)/g, "");
}

//true if the string is empty 
var isEmpty = function(text) {
	var isEmpty = true;
	for (var i = 0; i < text.length; i++) {
		if (text.charAt(i) != ' ') {
			isEmpty = false;
			break;
		}
	}
	return isEmpty;
}

//true if the string is int and great than zero or equals zero
var isIntGreatZero = function(str) {
	if (isEmpty(str))
		return false;
	var temp1 = true;
	var temp2 = '0123456789';
	for (var i = 0; i < str.length; i++) {
		var c = str.charAt(i);
		if (temp2.indexOf(c) == -1) {
			temp1 = false;
			break;
		} else {
			if (c == '0' && i == 0 && str.length > 1) {
				temp1 = false;
				break;
			}
		}
	}
	return temp1;
}

//true if the string is float and great than zero or equals zero
var isFloatGreatZero = function(str) {
	if (isEmpty(str))
		return false;
	var temp1 = true;
	var temp2 = '0123456789';
	for (var i = 0, j = 0; i < str.length; i++) {
		var c = str.charAt(i);
		if (temp2.indexOf(c) != -1 || c == '.') {
			if (c == '.') {
				if (i == 0 || i == str.length - 1) {
					temp1 = false;
					break;
				} else {
					j = j + 1;
					if (j > 1) {
						temp1 = false;
						break;
					}
				}
			} else if (c == '0') {
				if (i == 0) {
					if (str.length > 1) {
						if (str.charAt(1) != '.') {
							temp1 = false;
							break;
						}
					}
				}
			}
		} else {
			temp1 = false;
			break;
		}
	}
	return temp1;
}
