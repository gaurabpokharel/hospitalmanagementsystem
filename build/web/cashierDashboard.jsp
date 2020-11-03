<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cashier Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="css/blood.css">
    <link rel="stylesheet" href="css/Feedback.css">
    <style>
        .dropdown-img:hover .dropdown-menu {
            display: block;
        }
    </style>
</head>

<body class="">
    <div class="h-screen w-screen flex flex-col">
        <nav class="w-full flex justify-between px-5  shadow bg-white items-center">
            <div class="flex-1 flex items-center text-xl font-bold  font-body">
                <span class=" overflow-hidden ">
                    <img src="img/cash-logo.png" alt="" class="h-20 object-cover">
                </span>
            </div>
            <div class="dropdown-img inline-block relative w-24 py-1 text-right  ">

                <span class="text-red-600 flex list-none  ">
                    <img src="img/donor.png " alt="" class="h-12 w-12">
                </span>
                <ul class="dropdown-menu absolute hidden text-gray-700 pt-1 w-full button-0 right-0 mr-8  px-3 ">
                    <li
                        class="w-24 text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                        <a href="staffchangepassword.jsp"
                            class="rounded-t bg-gray-300 hover:bg-red-600 hover:text-white py-2 px-4 block whitespace-no-wrap"
                            href="staffchangepassword.jsp">Change<br> Password</a>
                    </li>
                    <li
                        class="w-24 text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                        <a href="staffLogout"
                            class="bg-gray-300  py-2 px-4 block whitespace-no-wrap hover:bg-red-600 hover:text-white "
                            href="staffLogout">logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--content part-->
        <div class="w-full flex justify-between items-center mt-20">
            <!--card and form part-->
            <div class="flex flex-col flex-1">
                <section class="md:flex justify-center p-5 w-full mt-6 ">
                    <a href="cashierPatientLogin.jsp"
                        class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-48  rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                        <div class="flex justify-center h-auto w-full bg-blue-200 rounded-b-full">
                            <img src="img/tutor.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold  px-5 py-4 mt-1">Visiting Amount</div>
                    </a>
                    <a href="cashierSearchById.jsp"
                        class="flex flex-col bg-gray-200  hover:bg-red-600 hover:text-white h-auto w-48 ml-4 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300">
                        <div class="flex justify-center h-32 w-full bg-pink-200 rounded-b-full">
                            <img src="img/lab1.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold  mt-3 px-5 py-4">Lab Bills</div>
                    </a>
                    <a href="cashierPatientAmount.jsp"
                        class="flex flex-col bg-gray-200  hover:bg-red-600 hover:text-white h-auto w-48 ml-4 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300">
                        <div class="flex justify-center h-32 w-full bg-purple-200 rounded-b-full">
                            <img src="img/payment.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold mt-3 px-5 py-4">Payment Amount</div>
                    </a>
                </section>
            </div>
            <!-- blood img-->
            <div class="flex flex-1 p-2">
                <img src="img/cashier1.jpg" alt="" class="w-full object-cover">
            </div>
        </div>
    </div>
</body>

</html>