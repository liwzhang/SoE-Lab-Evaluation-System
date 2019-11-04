

function fileisValid(event){
    var files = event.target.files;
    var file = files[0];
    var reader = new FileReader();
    reader.onload = function(){
        //alert(reader.result)
    }
    reader.readAsBinaryString(file)
    return false
}

