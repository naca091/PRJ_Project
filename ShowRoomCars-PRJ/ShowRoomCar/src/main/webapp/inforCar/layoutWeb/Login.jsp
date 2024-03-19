
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="main.css">
<meta name="robots" content="noindex, follow">
<script nonce="7598b8ae-3506-4320-8698-40fab8318dce">(function(w,d){!function(bb,bc,bd,be){bb[bd]=bb[bd]||{};bb[bd].executed=[];bb.zaraz={deferred:[],listeners:[]};bb.zaraz.q=[];bb.zaraz._f=function(bf){return async function(){var bg=Array.prototype.slice.call(arguments);bb.zaraz.q.push({m:bf,a:bg})}};for(const bh of["track","set","debug"])bb.zaraz[bh]=bb.zaraz._f(bh);bb.zaraz.init=()=>{var bi=bc.getElementsByTagName(be)[0],bj=bc.createElement(be),bk=bc.getElementsByTagName("title")[0];bk&&(bb[bd].t=bc.getElementsByTagName("title")[0].text);bb[bd].x=Math.random();bb[bd].w=bb.screen.width;bb[bd].h=bb.screen.height;bb[bd].j=bb.innerHeight;bb[bd].e=bb.innerWidth;bb[bd].l=bb.location.href;bb[bd].r=bc.referrer;bb[bd].k=bb.screen.colorDepth;bb[bd].n=bc.characterSet;bb[bd].o=(new Date).getTimezoneOffset();if(bb.dataLayer)for(const bo of Object.entries(Object.entries(dataLayer).reduce(((bp,bq)=>({...bp[1],...bq[1]})),{})))zaraz.set(bo[0],bo[1],{scope:"page"});bb[bd].q=[];for(;bb.zaraz.q.length;){const br=bb.zaraz.q.shift();bb[bd].q.push(br)}bj.defer=!0;for(const bs of[localStorage,sessionStorage])Object.keys(bs||{}).filter((bu=>bu.startsWith("_zaraz_"))).forEach((bt=>{try{bb[bd]["z_"+bt.slice(7)]=JSON.parse(bs.getItem(bt))}catch{bb[bd]["z_"+bt.slice(7)]=bs.getItem(bt)}}));bj.referrerPolicy="origin";bj.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(bb[bd])));bi.parentNode.insertBefore(bj,bi)};["complete","interactive"].includes(bc.readyState)?zaraz.init():bb.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
<style>
.login-message {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: rgba(0, 0, 0, 0.8);
	color: white;
	text-align: center;
	padding: 10px;
	z-index: 9999;
}

.signup-image-link {
	display: inline-block;
	padding: 10px 99px;
	background-color: #fff;
	color: #333;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.signup-image-link:hover {
	background-color: #2980b9;
}
</style>

</head>
<body>
	<div class="main">
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<a href="/ShowRoomCar/LoadCarsServlet"><img
								src="data:image/jpeg;base64,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"
								alt="sing up image"></a>
						</figure>
						<a href="Register.jsp" class="signup-image-link">Create an
							account</a>
					</div>
					<div class="signin-form">
						<h2 class="form-title">Log in</h2>
						<form action="${pageContext.request.contextPath}/Login"
							method="POST" class="register-form" id="login-form">
							<div class="form-group">
								<label for="your_name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="Name" id="your_name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="Password" id="your_pass"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>

						</form>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="js/global.js"></script>
	<script src="js/main.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
		integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA=="
		data-cf-beacon='{"rayId":"81eb81ff98690980","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
		crossorigin="anonymous"></script>
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const loginForm = document.getElementById("login-form");
	    loginForm.addEventListener("submit", function (event) {
	        event.preventDefault();

	        const yourName = document.getElementById("your_name").value.trim();
	        const yourPass = document.getElementById("your_pass").value.trim();

	        if (yourName === "" || yourPass === "") {
	            alert("You need to enter your account to log in");
	        } else {
	            // Continue with the login process
	            // You can submit the form or perform other actions here
	            loginForm.submit(); // This submits the form
	        }
	    });
	});

    </script>
</body>
</html>