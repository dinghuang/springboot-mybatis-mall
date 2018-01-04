indexSlides.parameterUpdate=function(){
	
	var winW=$(window).width();
	
	/*==此处是为了本项目样式设置==*/
//	if(winW<1000)
//		winW=1000;
	winW=980;
	/*====================*/
	
	$('#slide-index').width(winW);
	$('#slide-index .slides').width(winW*(indexSlides.style.length+1));
	indexSlides.obj.width(winW);

	var offset=(winW-1000)/2;

	for(var i=0; i<indexSlides.style.length; i++){
		temp=offset+parseInt(indexSlides.style[i].text.left);
		indexSlides.css[i].text.left=temp+'px';
		temp=offset+parseInt(indexSlides.style[i].button.left);
		indexSlides.css[i].button.left=temp+'px';
	}
	
}

indexSlides.ini=function(){
	
	// clone obj
	indexSlides.css=[];
	
	
	for(var i=0; i<indexSlides.style.length; i++){
		indexSlides.css[i]={}
		indexSlides.css[i].text={};
		indexSlides.css[i].text.left=indexSlides.style[i].text.left;
		indexSlides.css[i].text.top=indexSlides.style[i].text.top;
		indexSlides.css[i].button={};
		indexSlides.css[i].button.left=indexSlides.style[i].button.left;
		indexSlides.css[i].button.top=indexSlides.style[i].button.top;
		indexSlides.css[i].direction=indexSlides.style[i].direction;
	}
	
	indexSlides.parameterUpdate();
	
	indexSlides.obj.eq(0).clone().appendTo('#slide-index .slides');
	
	$('#slide-index .control a').each(function(i){
		$(this).click(function(e){
			e.preventDefault();
			indexSlides.pause();
			indexSlides.goto(i);
			indexSlides.start();
		});
	});
	
	indexSlides.goto(0);
	indexSlides.start();

}

indexSlides.goto=function(i){

	if(indexSlides.animating || i==indexSlides.current)
		return false;

	indexSlides.animating=true;

	var j=i;
	if(i>=indexSlides.style.length)
		j=0;

	indexSlides.clearStage(i);

	indexSlides.current=j;
	
	$('#slide-index .control a').removeClass('active').eq(j).addClass('active');
	$obj=$('#slide-index .slide').eq(i);
	
	if(indexSlides.css[j].direction=='tb'){
	
		var initialTextCSS={
			'left':indexSlides.css[j].text.left,
			'top':-$obj.find('.text').height()
		};
		
		var initialButtonCSS={
			'left':indexSlides.css[j].button.left,
			'top':$obj.height()+$obj.find('.button').height()
			
		};
	
	}else if(indexSlides.css[j].direction=='lr'){
	
		var initialTextCSS={
			'left':-parseInt($obj.find('.text').width())+'px',
			'top':indexSlides.css[j].text.top
		};
		
		var initialButtonCSS={
			'left':500,
			'top':indexSlides.css[j].button.top,
			'width':$obj.find('.button').width()
			
		};
		
	}

	$obj.find('.text').css(initialTextCSS);
	$obj.find('.button').css(initialButtonCSS)
	
	var left=-i*indexSlides.obj.width();
	
	$('#slide-index .slides').animate({'margin-left':left},500,function(){
		$obj.find('.text').animate(indexSlides.css[j].text,300,function(){
			$obj.find('.button').show().animate(indexSlides.css[j].button,300, "swing",function(){
				
				if(i>=indexSlides.css.length){
					$obj=$('#slide-index .slide').eq(0);
					$obj.find('.text').css(indexSlides.css[j].text);
					$obj.find('.button').css(indexSlides.css[j].button);
					$('#slide-index .slides').css('margin-left','0px');
				}
				
				indexSlides.animating=false;
				indexSlides.reformat();
				
			});
		});
	});
	
}

indexSlides.start=function(){
	indexSlides.timer=setInterval(indexSlides.next,6000);
}

indexSlides.pause=function(){
	if(indexSlides.timer)
		clearInterval(indexSlides.timer);
}

indexSlides.next=function(){
	var next=indexSlides.current+1;

	// if(next>=indexSlides.total)
		// next=0;
	
	indexSlides.goto(next);
}

indexSlides.clearStage=function(i){
	if(indexSlides.current>-1){
		indexSlides.animating=true;
		var left=3000;
		if(i<indexSlides.current)
			left=-1000;
		indexSlides.obj.eq(indexSlides.current).find('.text, .button').animate({'left':left+'px'},500,function(){
		});
	}
}

indexSlides.reformat=function(){
	indexSlides.parameterUpdate();
	if(!indexSlides.animating){
		var left=-indexSlides.current*indexSlides.obj.width();
		$('#slide-index .slides').css({
			'margin-left':left
		});
		
		$obj=$('#slide-index .slide').eq(indexSlides.current);
		$obj.find('.text').css(indexSlides.css[indexSlides.current].text);
		$obj.find('.button').css(indexSlides.css[indexSlides.current].button);
		
	}
}


var latestNews={};
latestNews.timer=false;
latestNews.current=-1;
latestNews.obj=$('#latest-news-index .latest-news .content');
latestNews.news=latestNews.obj.find('div');
latestNews.total=latestNews.news.length;
latestNews.ini=function(){

	latestNews.news.clone().appendTo(latestNews.obj);
	latestNews.start();

	if($.browser.msie && parseInt($.browser.version)>7){
		var $title=$('#latest-news-index .latest-news .title');
		var bgSrc=$title.find('img').attr('src');
		$title.find('img').remove();
		$title.parent().css({
			'background-image':'url('+bgSrc+')',
			'background-repeat':'no-repeat',
			'background-position':'0 50%'
		});
	}

}
latestNews.next=function(){

	var lineHeight=parseInt(latestNews.news.css('height'));

	latestNews.current++;
	if(latestNews.current>latestNews.total){
		latestNews.obj.css({'margin-top':0});
		latestNews.current=1;
	}

	var margin=-latestNews.current*lineHeight;
	latestNews.obj.animate({'margin-top':margin});

}
latestNews.start=function(){
	latestNews.timer=setInterval(latestNews.next,4000);
}
latestNews.pause=function(){
	if(latestNews.timer)
		clearInterval(latestNews.timer);
}


var featurePopup={}
featurePopup.timer=false;
featurePopup.popup=$('#feature-popup');
featurePopup.ini=function(){

	$('#feature-popup .close').click(function(e){
		e.preventDefault;
		featurePopup.hide();
	});
	
	// ----------------------------
	// add by bob 2011-04-07 (start)
	// var timeout1;
	// $('#feature-trigger').mouseout(function(){
		// clearTimeout(timeout1);
	// });
	// ----------------------------
	
	$('#feature-trigger').hover(function(){

		if(!featurePopup.disappearing)
			if(featurePopup.timer)
				clearTimeout(featurePopup.timer);

		var target='case';
		var $target=$('#feature-popup .'+target);
		var position=$(this).offset();
		position.left = position.left -0.5;
		if(iPx()){
			position.top = 303;
		}else{
			position.top = position.top-$target.height()+$(this).height()+8;
		}
		
		// ----------------------------
		// add by bob 2011-04-07
		// featurePopup.popup.css(position).show();
		// var f = function(){};
		// timeout1 = setTimeout(f,500);
		// ----------------------------

		var f = function(){
			featurePopup.popup.css(position).show();
			var maskCssBefore={
				'top':$target.height(),
				'left':-$target.width()
			};
	
			var caseCssBefore={
				'top':-$target.height(),
				'left':$target.width()
			};
			
			/*
			 * 
			 * var maskCssAfter={ 'top':'0px', 'left':'0px' };
			 * 
			 * var caseCssAfter={ 'top':'0px', 'left':'0px' };
			 * 
			 */
			
			var animationInterval=15;
			var animationStep=-1;
			
			var maskStep={
				'top':-$target.height()/animationInterval,
				'left':$target.width()/animationInterval
			};
			
			var caseStep={
				'top':$target.height()/animationInterval,
				'left':-$target.width()/animationInterval
			};
			
			
			function featureAnimate(){
				
				animationStep++;
	
				$('#feature-popup .mask').css({
					'top':parseInt(maskCssBefore.top)+animationStep*maskStep.top,
					'left':parseInt(maskCssBefore.left)+animationStep*maskStep.left
				},1);
				$target.css({
					'top':parseInt(caseCssBefore.top)+animationStep*caseStep.top,
					'left':parseInt(caseCssBefore.left)+animationStep*caseStep.left
				},1);
	
				if(animationStep>=animationInterval)
					clearInterval(animationTimer);
	
			}
		
			$('#feature-popup .mask').css(maskCssBefore);
			$target.css(caseCssBefore);
			var animationTimer=setInterval(featureAnimate,1);
		}

		timeout1 = setTimeout(f,500);
		
		
		/*
		 * $('#feature-popup .mask').css(maskCssBefore).animate(maskCssAfter);
		 * $target.css(caseCssBefore).animate(caseCssAfter);
		 */

	},featurePopup.hide);
	
	featurePopup.popup.hover(function(){
		if(!featurePopup.disappearing){
			if(featurePopup.timer)
				clearTimeout(featurePopup.timer);
		}
	},featurePopup.hide);

	$('#feature-popup .detail').click(function(){
		window.location=$('a',this).attr('href');
	});
	
};

featurePopup.hide=function(){

	featurePopup.timer=setTimeout(function(){
		featurePopup.disappearing=true;
		if($.browser.msie){
			featurePopup.disappearing=false;
			var hide2 = function(){featurePopup.popup.hide();}
			timeout2 = setTimeout(hide2,500);
		}else{
			featurePopup.popup.stop().fadeOut(200,function(){
				featurePopup.disappearing=false;
				featurePopup.popup.hide();
			});
		}
	},20);
		
}