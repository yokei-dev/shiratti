window.change =function change(){
  radio = document.getElementsByName('daily_task[condition]') 
  if(radio[0].checked) {
    // console.log('a')
    document.getElementById('face').style.display = "none";
  }else if(radio[1].checked) {
    document.getElementById('face').style.display = "";
  }else if(radio[2].checked) {
    document.getElementById('face').style.display = "";
  }
}