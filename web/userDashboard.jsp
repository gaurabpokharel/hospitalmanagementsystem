<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="css/blood.css">
    <link rel="stylesheet" href="css/Feedback.css">
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

<body class="">
    <div class="h-screen w-screen flex flex-col justify-between">
        <nav class="w-full flex justify-between px-5  shadow bg-white items-center">
            <div class="flex-1 flex items-center text-xl font-bold  font-body">
                <span class=" overflow-hidden ">
                    <img src="img/blood-logo.png" alt="" class="h-16 object-cover">
                </span>

            </div>
            <div class="dropdown-img inline-block relative w-24 py-1 text-right  ">

                <span class="text-red-600 flex list-none  ">
                    <img src="img/donor.png " alt="" class="h-12 w-12">
                </span>
                <ul class="dropdown-menu absolute hidden text-gray-700 pt-1 w-full button-0 right-0 mr-8  px-3 ">
                    <li
                        class="w-24 text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                        <a href="recoverPassword.jsp"
                            class="rounded-t bg-gray-300 hover:bg-red-600 hover:text-white py-2 px-4 block whitespace-no-wrap"
                            href="recoverPassword.jsp">Change<br> Password</a>
                    </li>
                    <li
                        class="w-24 text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                        <a href="userLogout"
                            class="bg-gray-300  py-2 px-4 block whitespace-no-wrap hover:bg-red-600 hover:text-white "
                            href="userLogout">logout</a>
                    </li>
                </ul>
            </div>

        </nav>
        <!--content part-->
        <div class="w-full flex justify-between  items-center  ">
            <!--card and form part-->
            <div class="flex flex-col flex-1">
                <section class="md:flex justify-center p-5 w-full mt-6 ">
                    <a href="userbooking.jsp"
                        class="flex flex-col bg-gray-200 hover:text-white hover:bg-red-600 h-auto w-48  rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300 hover:focous">
                        <div class="flex justify-center h-auto w-full bg-blue-200 rounded-b-full">
                            <img src="img/tutor.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold  px-3 py-4 mt-3"> Make Online Booking For
                            Ticket
                        </div>

                    </a>
                    <a href="appointment.jsp"
                        class="flex flex-col bg-gray-200  hover:bg-red-600 hover:text-white h-auto w-48 ml-4 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300">
                        <div class="flex justify-center h-32 w-full bg-pink-200 rounded-b-full">
                            <img src="img/cources.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold  mt-3 px-3 py-4"> Make Online Appointment
                        </div>
                    </a>
                    <a href="userPreviousAppointment.jsp"
                        class="flex flex-col bg-gray-200  hover:bg-red-600 hover:text-white h-auto w-48 ml-4 rounded-lg shadow-md items-center overflow-hidden transform hover:-translate-y-2 transition-all duration-300">
                        <div class="flex justify-center h-32 w-full bg-purple-200 rounded-b-full">
                            <img src="img/service.png" alt="" class="h-32 w-32">
                        </div>
                        <div class="font-body text-xl text-center font-bold mt-3 px-3 py-4"> View Previous Appointment
                        </div>
                    </a>



                </section>
                <div class=" flex justify-center mt-5 ">

                    <a href="bloodDonationForm.jsp"
                        class="text-xl font-bold font-body transition duration-500 ease-in-out   bg-red-600 text-white rounded-full px-6 py-2 transform hover:-translate-y-1 hover:scale-110 hover:bg-red-700 shadow-md">
                        Form for blood donation
                    </a>

                </div>

            </div>
            <!-- blood img-->
            <div class="flex flex-1 mt-1   p-2">
                <img src="img/bloodbg4.jpg" alt="" class="w-full h-auto object-cover">

            </div>



        </div>
        <div class="w-full p-2 flex justify-end items-end">
            <button class="font-body font-bold bg-gray-300 py-3 px-10 rounded-md text-center "
                onclick="openForm()">Feedback</button>

            <div class="chat-popup rounded" id="myForm">
                <form action="#"
                    class="form-container box-border border border-gray-400 rounded-md w-64 flex flex-col text-center font-bold">
                    <span class="p-2">Message</span>
                    <textarea placeholder="Type your feedback.." name="msg" required class="font-body"></textarea>

                    <button type="submit" class="btn">Send</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                </form>
            </div>

        </div>


    </div>
    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
</body>

</html>