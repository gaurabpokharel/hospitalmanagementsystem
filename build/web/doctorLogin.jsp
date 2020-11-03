

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Login Pannel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="css/blood.css">
     
 <script type="text/javascript">
function validation()
{

        
var x=document.form.demail.value;  
var atposition=x.indexOf("@");  
var dotposition=x.lastIndexOf(".");  
if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
  alert("Please enter a valid e-mail address");  
document.form.demail.select();
  return false;  
  }
  
var num=document.form.id.value;  
if (isNaN(num)){  
  alert("Enter Numeric value only");  
document.form.id.select();
  return false;  
}
}
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

</script>

</head>

<body class="h-screen w-screen flex justify-center items-center bg-gray-100">
    <section class="md:flex justify-between max-w-4xl mx-auto overflow-hidden shadow-md rounded-lg bg-white">
        <div class="flex-1">
            <img src="img/doctorlogin.jpg" style="height:500px;" alt="" class="w-full h-auto object-cover">
            
        </div>
        <div class="flex-1">
            <form  onsubmit="return validation()" action="doctorLogin" class=" p-6 flex flex-col" method="POST">

                <div class="flex flex-col mt-3 h-full">
                    <!--signin-->
                    <div class="flex flex-col items-center justify-center text-center font-header font-bold">
                        <span class="text-3xl">Doctor Login</span>
                    </div>
                    <!--input field-->
                    <div class="flex flex-col h-auto justify-start mt-2 ">
			<!--ID-->
                        <div class="flex flex-col h-auto mt-3">
                            <label for="" class="font-header font-bold text-gray-600 text-sm ml-3">ID</label>
                            <span class="flex items-center p-2  rounded-sm relative mt-1">
                                <i class="fas fa-id-card text-lg text-gray-600 absolute ml-5 buttom-0 left-0"></i>
                                <input name="id"
                                    class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-3 px-10 block w-full appearance-none leading-normal text-left"
                                    type="text" placeholder="ID">
                            </span>
                            
                        </div>
                        <!--username-->
                        <div class="flex flex-col h-auto mt-3">
                            <label for="" class="font-header font-bold text-gray-600 text-sm ml-3">Username</label>
                            <span class="flex items-center p-2  rounded-sm relative mt-1">
                                <i class="fa fa-envelope text-lg text-gray-600 absolute ml-5 buttom-0 left-0"></i>
                                <input name="demail"
                                    class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-3 px-10 block w-full appearance-none leading-normal text-left"
                                    type="text" placeholder="Email">
                            </span>
                            
                        </div>
                        <!--password-->
                        <div class="flex flex-col h-auto mt-3">
                            <span class="flex justify-between text-gray-600">
                                <label for="" class="font-header font-bold text-sm ml-3">Password</label>
                                <a href="forgetPassword.jsp" class="font-header font-bold text-sm mr-3">Forgot password?</a>
                            </span>
                            <span class="flex items-center p-2 rounded-sm  relative mt-1">
                                <i class="fas fa-lock text-lg text-gray-600 absolute ml-5 buttom-0 left-0"></i>
                                <input name="dpassword" type="password" id="myInput"
                                    class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-3 px-10 block w-full appearance-none leading-normal text-left"
                                    type="password" placeholder="Password">
                                <i class="far fa-eye text-lg text-gray-600 absolute mr-4 buttom-0 right-0"
                                    onclick="myFunction()" id="eyeopen"></i>
                                <i class="fas fa-eye-slash text-lg text-gray-600 absolute mr-4 buttom-0 right-0"
                                    id="eyeclose" style="display: none;" onclick="myFunction2()"></i>

                            
                        </div>
                    </div>
                    <!--Login button-->
                    <div class="flex flex-col h-auto mt-3 p-2">
                        <button type="submit"
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Login</button>
                    </div>
                </div>
            </form>
        </div>

    </section>

    <script>
        function myFunction() {
            var x = document.getElementById("myInput");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
            document.getElementById("eyeclose").style.display = "block";
            document.getElementById("eyeopen").style.display = "none";

        }
        function myFunction2() {
            var x = document.getElementById("myInput");
            if (x.type === "text") {
                x.type = "password";
            } else {
                x.type = "text";
            }
            document.getElementById("eyeclose").style.display = "none";
            document.getElementById("eyeopen").style.display = "block";

        }



    </script>
</body>
</body>

</html>