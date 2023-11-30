const progress = document.querySelector(".habit .plan-enroll .form-check .middle .slider .progress");
	const rangeInput = document.querySelectorAll(".habit .plan-enroll .form-check .middle .range-input input");
     const dayInput = document.querySelectorAll(".habit .plan-enroll .form-check .day-input input");
     
const progress2 = document.querySelector(".short .slider .progress");
	const rangeInput2 = document.querySelectorAll(".short .range-input input");
     const dayInput2 = document.querySelectorAll(".short .day-input input");
     
const progress3 = document.querySelector(".long .slider .progress");
	const rangeInput3 = document.querySelectorAll(".long .range-input input");
     const dayInput3 = document.querySelectorAll(".long .day-input input");
	

 let dayGap = 1;

dayInput.forEach(input => {
  input.addEventListener("input", e =>{
    let minVal = parseInt(dayInput[0].value), 
    maxVal = parseInt(dayInput[1].value);

    if((maxVal - minVal >= dayGap) && maxVal <= 28) {
      if(e.target.className === "input-min form-control"){
        rangeInput[0].value = minVal;
        progress.style.left = (minVal / rangeInput[0].max) * 100 + "%";
      } else {
        rangeInput[1].value = maxVal;
        progress.style.right = 100 - (maxVal/rangeInput[1].max) * 100 + "%";
      }
    }

  });

});

rangeInput.forEach(input => {
  input.addEventListener("input", e =>{
	//getting two ranges value and parsing them to number
    let minVal = parseInt(rangeInput[0].value), 
    maxVal = parseInt(rangeInput[1].value);
	
	if (maxVal - minVal < dayGap){
		if(e.target.className === "input-left"){
			rangeInput[0].value = maxVal - dayGap;
		} else {
			rangeInput[1].value = minVal + dayGap;
		}
	} else {
		dayInput[0].value = minVal;
		dayInput[1].value = maxVal;
		progress.style.left = (minVal / rangeInput[0].max) * 100 + "%";
    	progress.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";	
	}    
  });
});

dayInput2.forEach(input => {
  input.addEventListener("input", e =>{
    let minVal = parseInt(dayInput2[0].value), 
    maxVal = parseInt(dayInput2[1].value);

    if((maxVal - minVal >= dayGap) && maxVal <= 28) {
      if(e.target.className === "input-min form-control"){
        rangeInput2[0].value = minVal;
        progress2.style.left = (minVal / rangeInput2[0].max) * 100 + "%";
      } else {
        rangeInput2[1].value = maxVal;
        progress2.style.right = 100 - (maxVal/rangeInput2[1].max) * 100 + "%";
      }
    }

  });

});

rangeInput2.forEach(input => {
  input.addEventListener("input", e =>{
	//getting two ranges value and parsing them to number
    let minVal = parseInt(rangeInput2[0].value), 
    maxVal = parseInt(rangeInput2[1].value);
	
	if (maxVal - minVal < dayGap){
		if(e.target.className === "input-left"){
			rangeInput2[0].value = maxVal - dayGap;
		} else {
			rangeInput2[1].value = minVal + dayGap;
		}
	} else {
		dayInput2[0].value = minVal;
		dayInput2[1].value = maxVal;
		progress2.style.left = (minVal / rangeInput2[0].max) * 100 + "%";
    	progress2.style.right = 100 - (maxVal / rangeInput2[1].max) * 100 + "%";	
	}    
  });
});

dayInput3.forEach(input => {
  input.addEventListener("input", e =>{
    let minVal = parseInt(dayInput3[0].value), 
    maxVal = parseInt(dayInput3[1].value);

    if((maxVal - minVal >= dayGap) && maxVal <= 28) {
      if(e.target.className === "input-min form-control"){
        rangeInput3[0].value = minVal;
        progress3.style.left = (minVal / rangeInput3[0].max) * 100 + "%";
      } else {
        rangeInput3[1].value = maxVal;
        progress3.style.right = 100 - (maxVal/rangeInput3[1].max) * 100 + "%";
      }
    }

  });

});

rangeInput3.forEach(input => {
  input.addEventListener("input", e =>{
	//getting two ranges value and parsing them to number
    let minVal = parseInt(rangeInput3[0].value), 
    maxVal = parseInt(rangeInput3[1].value);
	
	if (maxVal - minVal < dayGap){
		if(e.target.className === "input-left"){
			rangeInput3[0].value = maxVal - dayGap;
		} else {
			rangeInput3[1].value = minVal + dayGap;
		}
	} else {
		dayInput3[0].value = minVal;
		dayInput3[1].value = maxVal;
		progress3.style.left = (minVal / rangeInput3[0].max) * 100 + "%";
    	progress3.style.right = 100 - (maxVal / rangeInput3[1].max) * 100 + "%";	
	}    
  });
});


const progress4 = document.querySelector(".togetherGoal .slider .progress");
	const rangeInput4 = document.querySelectorAll(".togetherGoal .range-input input");
     const dayInput4 = document.querySelectorAll(".togetherGoal .day-input input");
     
dayInput4.forEach(input => {
  input.addEventListener("input", e =>{
    let minVal = parseInt(dayInput4[0].value), 
    maxVal = parseInt(dayInput4[1].value);

    if((maxVal - minVal >= dayGap) && maxVal <= 28) {
      if(e.target.className === "input-min form-control"){
        rangeInput4[0].value = minVal;
        progress4.style.left = (minVal / rangeInput4[0].max) * 100 + "%";
      } else {
        rangeInput4[1].value = maxVal;
        progress4.style.right = 100 - (maxVal/rangeInput4[1].max) * 100 + "%";
      }
    }

  });

});

rangeInput4.forEach(input => {
  input.addEventListener("input", e =>{
	//getting two ranges value and parsing them to number
    let minVal = parseInt(rangeInput4[0].value), 
    maxVal = parseInt(rangeInput4[1].value);
	
	if (maxVal - minVal < dayGap){
		if(e.target.className === "input-left"){
			rangeInput4[0].value = maxVal - dayGap;
		} else {
			rangeInput4[1].value = minVal + dayGap;
		}
	} else {
		dayInput4[0].value = minVal;
		dayInput4[1].value = maxVal;
		progress4.style.left = (minVal / rangeInput4[0].max) * 100 + "%";
    	progress4.style.right = 100 - (maxVal / rangeInput4[1].max) * 100 + "%";	
	}    
  });
});
	