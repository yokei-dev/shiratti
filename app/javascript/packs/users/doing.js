window.change =function change(){
  radio = document.getElementsByClassName('doing')
  length = document.getElementsByClassName('doing').length
  for (let i = 0; i<length/3; i++) 
  if(radio[i*3+0].checked) {
    // console.log('a')
    document.getElementById(`face_${i}`).style.display = "none";
  }else if(radio[i*3+1].checked) {
    document.getElementById(`face_${i}`).style.display = "";
  }else if(radio[i*3+2].checked) {
    document.getElementById(`face_${i}`).style.display = "";
  }
}
