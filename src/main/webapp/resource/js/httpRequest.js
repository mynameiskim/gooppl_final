var XHR = null;

function getXHR(){
	
	if(window.ActiveXObject){ /*익스플로러*/
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){ /*크롬,파이널 폭스 등등*/
		return new XMLHttpRequest();
	}else{
		return null;
	}
}

function sendRequest(url,param,callback,method){
	
	XHR = getXHR();
	
	var newMethod = method?method:'GET';
	if(newMethod!='GET'&&newMethod!='POST'){
		newMethod='GET';
	}
	var newUrl = url;
	var newParam = (param==null||param=='')?null:param;
	
	if(newMethod=='GET'&&newParam!=null){
		newUrl=newUrl+'?'+newParam;		
	}
		
	XHR.onreadystatechange=callback;
	XHR.open(newMethod,newUrl,true);
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(newMethod=='POST'?newParam:null);
	
}