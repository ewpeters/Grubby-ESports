function initCssBrowserIdentifer(){
	// Checking for Firefox and it's versions
	if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)){ //test for Firefox/x.x or Firefox x.x (ignoring remaining digits);
		var ffversion=new Number(RegExp.$1) // capture x.x portion and store as a number
		if (ffversion>=3){
			document.getElementsByTagName('body')[0].className="ff3";
		}else if (ffversion>=2){
			document.getElementsByTagName('body')[0].className="ff2";
		}else if (ffversion>=1){
			document.getElementsByTagName('body')[0].className="ff1";
		}
	// Checking for IE and it's versions
	}else if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)){ //test for MSIE x.x;
		var ieversion=new Number(RegExp.$1) // capture x.x portion and store as a number
		if (ieversion>=8){
			document.getElementsByTagName('body')[0].className="ie8";
		}else if (ieversion>=7){
			document.getElementsByTagName('body')[0].className="ie7";
		}else if (ieversion>=6){
			document.getElementsByTagName('body')[0].className="ie6";
		}else if (ieversion>=5){
			document.getElementsByTagName('body')[0].className="ie5";
		}
	// Checking for Safari and it's versions
	}else if (/Safari[\/\s](\d+\.\d+)/.test(navigator.userAgent)){ //test for Version/x.x (ignoring remaining digits);
		var safversion=new Number(RegExp.$1) // capture x.x portion and store as a number
		if (safversion>=4){
			document.getElementsByTagName('body')[0].className="safari4";
		}else if (safversion>=3){
			document.getElementsByTagName('body')[0].className="safari3";
		}else if (safversion>=2){
			document.getElementsByTagName('body')[0].className="safari2";
		}else if (safversion>=1){
			document.getElementsByTagName('body')[0].className="safari1";
		}
	// Checking for Opera and it's versions
	}else if (/Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent)){ //test for Opera/x.x or Opera x.x (ignoring remaining decimal places);
		var oprversion=new Number(RegExp.$1) // capture x.x portion and store as a number
		if (oprversion>=10){
			document.getElementsByTagName('body')[0].className="opera10";
		}else if (oprversion>=9){
			document.getElementsByTagName('body')[0].className="opera9";
		}else if (oprversion>=8){
			document.getElementsByTagName('body')[0].className="opera8";
		}else if (oprversion>=7){
			document.getElementsByTagName('body')[0].className="opera7";
		}
	}
}

window.onload=initCssBrowserIdentifer;
