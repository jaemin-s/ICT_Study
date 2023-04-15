let cnt = 0;
setInterval(()=>{
    const $imgs = document.getElementById('slide-img');
    [...$imgs.children].forEach( c =>{
        // console.log([...$imgs.children].indexOf(c));
        c.classList.toggle('slide',[...$imgs.children].indexOf(c)===cnt);
    });
    // console.log(`이벤트 발생 ${cnt}`);
    cnt++;
    if(cnt===[...$imgs.children].length){
        cnt=0;
    }
},5000);

