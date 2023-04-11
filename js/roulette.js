const $spinBtn = document.querySelector('#spin-btn');
const $resetBtn = document.querySelector('#reset-btn');
const $ball = document.querySelector('.ball-location');
const spinAni = document.styleSheets[0].cssRules[1];
const $display = document.querySelector('#roulette .display-box p');
$spinBtn.addEventListener('click',(e)=>{
    let rn = Math.floor(Math.random()*1080)+3600;
    spinAni.appendRule(`100%{ transform : rotate(${rn}deg); height: 488px;}`);
    console.log(spinAni);
    $ball.classList.add('spin');
    setTimeout(function(){
        showrn(rn);
    },6000)
    // showrn(rn);
});
$resetBtn.addEventListener('click',(e)=>{
    $ball.classList.remove('spin');
    $display.textContent = '';
});

function showrn(rn){
    $display.textContent = whatNumber(rn%360);
}

function whatNumber(n){ //9.72
    console.log(n);
    if(n<=4.86 || n>354.77){
        return 0;  
    } 
    else if(4.85<n && n <=14.57) {return 32;}
    else if(14.57<n&& n <=24.29) {return 15;}
    else if(24.29<n&& n <=34.01) {return 19;}
    else if(34.01<n&& n <=43.73) {return 4;}
    else if(43.73<n&& n <=53.45) {return 21;}
    else if(53.45<n&& n <=63.17) {return 2;}
    else if(63.17<n&& n <=72.89) {return 25;}
    else if(72.89<n&& n <=82.61) {return 17;}
    else if(82.61<n&& n <=92.33) {return 34;}
    else if(92.33<n&& n <=102.05) {return 6;}
    else if(102.05<n&& n <=111.77) {return 27;}
    else if(111.77<n&& n <=121.49) {return 13;}
    else if(121.49<n&& n <=131.21) {return 36;}
    else if(131.21<n&& n <=140.93) {return 11;}
    else if(140.93<n&& n <=150.65) {return 30;}
    else if(150.65<n&& n <=160.37) {return 8;}
    else if(160.37<n&& n <=170.09) {return 23;}
    else if(170.09<n&& n <=179.81) {return 10;}
    else if(179.81<n&& n <=189.53) {return 5;}
    else if(189.53<n&& n <=199.25) {return 24;}
    else if(199.25<n&& n <=208.97) {return 16;}
    else if(208.97<n&& n <=218.69) {return 33;}
    else if(218.69<n&& n <=228.41) {return 1;} 
   else if(228.41<n&& n <=238.13) {return 20;}
    else if(238.13<n&& n <=247.85) {return 14;}
    else if(247.85<n&& n <=257.57) {return 31;}
    else if(257.57<n&& n <=267.29) {return 9;}
    else if(267.29<n&& n <=277.01) {return 22;}
    else if(277.01<n&& n <=286.73) {return 18;}
    else if(286.73<n&& n <=296.45) {return 29;}
    else if(296.45<n&& n <=306.17) {return 7;}
    else if(306.17<n&& n <=315.89) {return 28;}
    else if(315.89<n&& n <=325.61) {return 12;}
    else if(325.61<n&& n <=335.33) {return 35;}
    else if(335.33<n&& n <=345.05) {return 3;}
    else if(345.05<n&& n <=354.77) {return 26;}
}