var qzhq=false,qzu,qzw,qzfo,qzge;function art_InitResizing(qzaz,minWidth,minHeight,qzxi){var qzg=art_GetInstance(qzaz);if(cart_browser_ie){qzg.Frame.onmousemove=qzkr;};qzg.Frame.onmousedown=qzkt;qzg.Frame.onmouseout=qzlj;qzg.MinWidth=minWidth;qzg.MinHeight=minHeight;qzg.qzte=qzxi;};function qzmr(resizeThreshold,offsetX,offsetY,qzhd,qzga){var qzjt='';if(offsetY<=resizeThreshold){qzjt='n';}else if(offsetY>=qzga-resizeThreshold){qzjt='s';};if(offsetX<=resizeThreshold){qzjt+='w';}else if(offsetX>=qzhd-resizeThreshold){qzjt+='e';};return qzjt;};function qzeg(){if(qzw!=''){document.body.style.cursor=qzw+'-resize';}else{document.body.style.cursor='default';};};function qzkt(qzim){if(cart_browser_ie){event.cancelBubble=true;}else{qzim.preventDefault();qzim.stopPropagation();};if(qzu==null||qzw==''){return true;};qzhq=true;qzu.Frame.onmousemove=null;qzfo=document.body.onmousemove;qzge=document.body.onmouseup;document.body.onmousemove=qzks;document.body.onmouseup=qzlu;qzmi(qzu);return false;};function qzks(){if(cart_browser_ie){var qzAei=qzmh(event.srcElement),qzAeh=qzhf(event.srcElement),qzp=event.offsetX+qzAei,qzf=event.offsetY+qzAeh;}else{var qzp=qzim.pageX,qzf=qzim.pageY;};var frameObj=qzu.Frame,qzAaz=qzmh(frameObj),qzAay=qzhf(frameObj),qzhd=frameObj.offsetWidth,qzga=frameObj.offsetHeight,minHeight=qzu.MinHeight,minWidth=qzu.MinWidth,qzze=qzAaz,qzzd=qzAay,qzdh=qzga,qzgj=qzhd;if(qzw.indexOf('n')>=0){qzzd=qzf;qzdh=qzAay-qzf+qzga;}else if(qzw.indexOf('s')>=0){qzdh=qzf-qzAay;};if(qzw.indexOf('e')>=0){qzgj=qzp-qzAaz;}else if(qzw.indexOf('w')>=0){qzze=qzp;qzgj=qzAaz-qzp+qzhd;};qzdh=Math.max(minHeight,qzdh);qzgj=Math.max(minWidth,qzgj);var qzAax=frameObj.offsetHeight-qzdh,qzAcc=qzu.InnerFrame.offsetHeight;qzu.InnerFrame.style.height=qzAcc-qzAax;frameObj.style.left=qzze+'px';frameObj.style.top=qzzd+'px';frameObj.style.height=qzdh+'px';frameObj.style.width=qzgj+'px';qzgb(qzu,qzze,qzzd,qzgj,qzdh);return false;};function qzlu(qzim){if(cart_browser_ie){document.body.onmousemove=qzfo;document.body.onmouseup=qzge;qzu.Frame.onmousemove=qzkr;}else{document.onmousemove=qzfo;document.onmouseup=qzge;qzu.Frame.onmouseover=qzwn;};qzu.Frame.style.height=qzu.Frame.offsetHeight+'px';qzu.InnerFrame.style.height=qzu.InnerFrame.offsetHeight+'px';qzu.qzpf=qzu.Frame.offsetWidth;qzu.qznq=qzu.Frame.offsetHeight;qzjg(qzu);qzhq=false;qzw='';qzeg();if(qzu.qzlb){art_RepositionFloater(qzu);};return false;};function qzwn(qzim){var frameObj=qzkb(qzim.target),qzaz=qzwg(frameObj),qzg=qzhs(frameObj);if(!qzaz||qzhq||qztd||qzg.qzms||qzg.qzpk==0){return true;};qzw='';qzu=qzg;var offsetX=qzim.layerX,offsetY=qzim.layerY,qzhd=frameObj.offsetWidth,qzga=frameObj.offsetHeight,resizeThreshold=qzg.ResizeThreshold;qzw=qzmr(resizeThreshold,offsetX,offsetY,qzhd,qzga);var qzku=qzg.qzte;if(qzku=='FreeStyle'||(qzku=='Corners'&&qzw.length==2)||(qzku=='Vertical'&&(qzw=='n'||qzw=='s'))||(qzku=='Horizontal'&&(qzw=='w'||qzw=='e'))){}else{qzw='';};qzeg();};function qzkr(){var frameObj=qzkb(event.srcElement),qzg=null;if(frameObj){qzg=qzhs(frameObj);};if(!qzg||qzhq||qztd||qzg.qzms||qzg.qzpk==0){return true;};qzw='';qzu=qzg;var offsetX=qztz(event,frameObj),offsetY=qzty(event,frameObj),qzhd=frameObj.offsetWidth,qzga=frameObj.offsetHeight,resizeThreshold=qzg.ResizeThreshold;qzw=qzmr(resizeThreshold,offsetX,offsetY,qzhd,qzga);var qzku=qzg.qzte;if(qzku=='FreeStyle'||(qzku=='Corners'&&qzw.length==2)||(qzku=='Vertical'&&(qzw=='n'||qzw=='s'))||(qzku=='Horizontal'&&(qzw=='w'||qzw=='e'))){}else{qzw='';};qzeg();};function qzlj(qzim){if(!qzhq&&qzu!=null){qzw='';qzeg();};};var ComponentArt_Snap_Resize_Loaded=true;
