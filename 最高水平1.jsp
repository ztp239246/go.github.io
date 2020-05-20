<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style id='style'>
  body{
    margin:0;
	background-color:black;
    background-image:url(666.jpg);
     background-size: 100% 100%;
	background-repeat:no-repeat;
	width:100%;
	height:100%;
	display:flex;
	overflow:hidden;
  }
  ul,li{position:absolute}
  
  ul{
    list-style:none;
	padding:0;
	margin:0;
	/*border:2px solid green*/
  }
  
  li{
    left:0;
    right:0;
    top:50%;
    bottom:50%;
    text-align:right;
  }
  
  .clock{
    position:relative;
    width:1080px;
    height:1080px;
    color:white;
	text-shadow:0 0 10px white;
    border-radius:50%;
    margin:auto;
	
  }
  
  #hour{
    top:11em;
    bottom:11em;
    left:11em;
    right:11em;
	display:
  }
  
  #minute{
    top:6em;
    bottom:6em;
    left:6em;
    right:6em;
	
  }
  
  #second{
    top:1em;
    bottom:1em;
    left:1em;
    right:1em;
	
  }
  
  li>div{
    width:4em;
	text-align:center;
	display:inline-block;
	/*border:1px solid orange*/
  }
  
  #week{
    top:16em;
    bottom:16em;
    left:16em;
    right:16em;
  }
  
  #day{
    top:20em;
	bottom:20em;
	left:20em;
	right:20em;
  }
  
  #month{
    top:25em;
	bottom:25em;
	left:25em;
	right:25em;
  }
  
  #year{
    position:relative;
    top:50%;
	bottom:50%;
	text-align:center;
  }
  
  .focus{
    color:gold;
    text-shadow:0 0 10px gold
  }
  
  .clock>ul{
    transition-timing-function: linear;
  }
</style>
</head>
<body>
  <div class="clock">
	<div id="year" class="focus"></div>
	<ul id="month"></ul>
	<ul id="day"></ul>
	<ul id="week"></ul>
    <ul id="hour"></ul>
	<ul id="minute" class="sdeg"></ul>
	<ul id="second" class="sdeg"></ul>
  </div>
  <script>
	/*这代码写得我自己都看不懂  (๑•॒̀ ູ॒•́๑)啦啦啦*/
	numbers='拾壹貳叁肆伍陸柒捌玖';
	degs={
	  monthDeg:30,
	  dayDeg:0,
	  weekDeg:51.4285,
	  hourDeg:15,
	  msDeg:6
	};
	date=new Date();
	fyear=date.getFullYear();
	months=date.getMonth()+1;
	days=(months==2?(fyear%4==0?29:28):([1,3,5,7,8,10,12].includes(months)?31:30));
	degs.dayDeg=(months==2?(days==28?12.8571:12.4137):(days==30?12:11.6129));
	fyear+='';
	for(let i=0;i<fyear.length;i++)
	  year.innerHTML+=numbers[fyear[i]];
	year.innerHTML=year.innerHTML.replace(/拾/g,'零');
	year.innerHTML+='年';
	for(let i=0,li,mDeg=0,msDeg=0,hDeg=0,wDeg=0,dDeg=0,s='',sty=['>li:nth-of-type(','){transform:rotate(','deg)}'],n=1;i<6;i++){
	  for(let j=0;j<10;j++){
		s=numbers[j];
		if(i>0&&j>0)s=numbers[0]+s;
		if(i>1)s=numbers[i]+s;
		if(n<14){
		  li=document.createElement('li');
		  li.innerHTML='<div>'+s+'月</div>';
		  month.appendChild(li);
		  document.styleSheets[0].insertRule('#month'+sty[0]+n+sty[1]+mDeg+sty[2],0);
		  mDeg+=degs.monthDeg;
		}
		if(n<=days+1){
		  li=document.createElement('li');
	      li.innerHTML='<div>'+s+'日</div>';
	      day.appendChild(li);
		  document.styleSheets[0].insertRule('#day'+sty[0]+day.children.length+sty[1]+dDeg+sty[2],0);
		  dDeg+=degs.dayDeg;
		}
		if(n<8){
		  li=document.createElement('li');
		  li.innerHTML='星期'+(n==1?'日':s);
		  week.appendChild(li);
		  document.styleSheets[0].insertRule('#week'+sty[0]+n+sty[1]+wDeg+sty[2],0);
		  wDeg+=degs.weekDeg;
	    }
		if(n<25){
		  document.styleSheets[0].insertRule('#hour'+sty[0]+n+sty[1]+hDeg+sty[2],0);
		  hDeg+=degs.hourDeg;
		  li=document.createElement('li');
		  li.innerHTML='<div>'+s+'時</div>';
		  hour.appendChild(li);
		}
		document.styleSheets[0].insertRule('.sdeg'+sty[0]+n+sty[1]+msDeg+sty[2],0);
	    msDeg+=degs.msDeg;
		n++;
		li=document.createElement('li');
		li.innerHTML='<div>'+s+'分</div>';
		minute.appendChild(li);
		li=document.createElement('li');
		li.innerHTML='<div>'+s+'秒</div>';
		second.appendChild(li);
	  }
	}
	hour.firstChild.firstChild.innerHTML='零時';
	minute.firstChild.firstChild.innerHTML='零分';
	second.firstChild.firstChild.innerHTML='零秒';
	day.removeChild(day.firstChild);
	month.removeChild(month.firstChild);
	ss=document.styleSheets[0];
	rules=ss.cssRules?ss.cssRules:ss.rules;
	for(let i=0,rule,selector;i<rules.length;i++){
	  rule=rules[i];
	  selector=rule.selectorText;
	  if(['#month','#day','#week','#hour','#minute','#second'].includes(selector))rule.style.transitionDuration='.2s';
	  if(selector=='#second'){
	    sAngle=rule.style;
	  }else if(selector=='#minute'){
	    mAngle=rule.style;
	  }else if(selector=='#hour'){
	    hAngle=rule.style;
	  }else if(selector=='#week'){
	    wAngle=rule.style;
	  }else if(selector=='#day'){
	    dAngle=rule.style;
	  }else if(selector=='#month'){
	    MAngle=rule.style;
	  }
	}
	
	date=new Date();
	months=date.getMonth();
    MAngle.transform='rotate(-'+degs.monthDeg*months+'deg)';
	month.children[months].className='focus';
	days=date.getDate()-1;
	dAngle.transform='rotate(-'+degs.dayDeg*days+'deg)';
	day.children[days].className='focus';
	weeks=date.getDay();
	wAngle.transform='rotate(-'+degs.weekDeg*weeks+'deg)';
	week.children[weeks].className='focus';
	hours=date.getHours();
	hAngle.transform='rotate(-'+degs.hourDeg*hours+'deg)';
	hour.children[hours].className='focus';
	minutes=date.getMinutes();
	mAngle.transform='rotate(-'+degs.msDeg*minutes+'deg)';
	minute.children[minutes].className='focus';
	seconds=date.getSeconds();
	sAngle.transform='rotate(-'+degs.msDeg*seconds+'deg)';
	second.children[seconds].className='focus';
	
	timing=()=>{
	  date=new Date();
	  seconds=date.getSeconds();
	  if(!seconds){
	    seconds=60;
		setTimeout(()=>{
		  sAngle.transitionProperty='none';
		  sAngle.transform='';
		  setTimeout("sAngle.transitionProperty=''",200);
	    },400);
	  }
	  sAngle.transform='rotate(-'+degs.msDeg*seconds+'deg)';
	  document.querySelector('#second>.focus').removeAttribute('class');
	  if(seconds==60){
	    seconds=0;
		minutes=date.getMinutes();
	    if(!minutes){
	      minutes=60;
		  setTimeout(()=>{
		    mAngle.transitionProperty='none';
		    mAngle.transform='';
		    setTimeout("mAngle.transitionProperty=''",200);
		  },400);
	    }
	    mAngle.transform='rotate(-'+degs.msDeg*minutes+'deg)';
		document.querySelector('#minute>.focus').removeAttribute('class');
		if(minutes==60){
		  minutes=0;
		  hours=date.getHours();
		  if(!hours){
		    hours=24;
			setTimeout(()=>{
			  hAngle.transitionProperty='none';
			  hAngle.transform='';
			  setTimeout("hAngle.transitionProperty=''",200);
			},400);
		  }
		  hAngle.transform='rotate(-'+degs.hourDeg*hours+'deg)';
		  document.querySelector('#hour>.focus').removeAttribute('class');
		  if(hours==24){
		    hours=0;
			weeks=date.getDay();
			if(!weeks){
			  weeks=7;
			  setTimeout(()=>{
			    wAngle.transitionProperty='none';
				wAngle.transform='';
				setTimeout("wAngle.transitionProperty=''",200);
			  },400);
			}
			wAngle.transform='rotate(-'+degs.weekDeg*weeks+'deg)';
			document.querySelector('#week>.focus').removeAttribute('class');
			if(weeks==7){
			  weeks=0;
			  days=date.getDate()-1;
			  if(!days){
			    days=day.children.length;
				setTimeout(()=>{
				  dAngle.transitionProperty='none';
				  dAngle.transform='';
				  setTimeout("dAngle.transitionProperty=''",200);
				},400);
			  }
			  dAngle.transform='rotate(-'+degs.dayDeg*days+'deg)';
			  document.querySelector('#day>.focus').removeAttribute('class');
			  if(days==day.children.length){
			    days=0;
				if(date.getMonth()!=months||date.getFullYear()!=fyear)location.href=location.href;
			  }
			  day.children[days].className='focus';
			}
			week.children[weeks].className='focus';
		  }
		  hour.children[hours].className='focus';
		}
		minute.children[minutes].className='focus';
	  }
	  second.children[seconds].className='focus';
	}
	setInterval(timing,1000);
  </script>
</body>
</html>