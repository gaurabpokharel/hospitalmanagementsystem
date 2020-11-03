<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="css/blood.css">
    <style>
        .dropdown-img:hover .dropdown-menu {
            display: block;
        }

        body,
        html {
            height: 100%;
            margin: 0;
        }

        .bg {
            /* The image used */
            background-image: url("img/bloodbg5.jpg");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>

<body class="h-screen w-screen flex flex-col overflow-y-hidden ">
    <nav class="w-full flex justify-between px-5  shadow bg-white items-center">
        <div class="flex-1 flex items-center text-xl font-bold  font-header">
            <span class=" overflow-hidden ">
                <img src="img/staff-logo.png" alt="" class="h-16 object-cover">
            </span>

        </div>


    </nav>
    <!--content part-->
    <div class="w-full flex justify-between items-center mt-10">
        <!-- blood img-->
        <div class="flex flex-1  p-2">
            <img src="img/staff1.jpg" alt="" class="w-full h-auto object-cover">

        </div>
        <!--card and form part-->
        <div class="flex flex-col flex-1">
            <section class="flex justify-center w-full">
                <a href="stafflogin.jsp?value=admin"  
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32 mr-8 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-green-300 rounded-b-full">
                        <img src="img/admin1.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  px-2 py-6 mb-2 "> Admin
                    </div>

                </a>
                <a href="stafflogin.jsp?value=receptionist"
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32 mr-8 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-blue-300 rounded-b-full">
                        <img src="img/receptionist1.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  px-2 py-6 mb-2 "> Receptionist
                    </div>

                </a>
                <a href="doctorLogin.jsp?value=doctor"
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32  rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-purple-300 rounded-b-full">
                        <img src="img/doctor1.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  px-2 py-6 mb-2 "> Doctor
                    </div>

                </a>




            </section>
            <section class="flex justify-center w-full mt-5">
                <a href="stafflogin.jsp?value=lab"
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32 mr-8  rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-purple-300 rounded-b-full">
                        <img src="img/lab1.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  p-2"> Lab Technician
                    </div>

                </a>
                <a href="stafflogin.jsp?value=cashier"
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32 mr-8 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-blue-300 rounded-b-full">
                        <img src="img/cashier.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  p-2 mt-3"> Cashier
                    </div>

                </a>
                <a href="stafflogin.jsp?value=pharmacy"
                    class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-32  rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                    <div class="flex justify-center h-auto w-full bg-green-300 rounded-b-full">
                        <img src="img/pharmacy.png" alt="" class="h-24 w-24">
                    </div>
                    <div class="font-header text-xl text-center font-bold  p-2 mt-3"> Pharmacy
                    </div>

                </a>




            </section>


        </div>

    </div>
</body>

</html>