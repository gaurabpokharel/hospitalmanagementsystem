<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="css/blood.css">
    <link rel="stylesheet" href="Feedback.css">
    <style>
        .dropdown-img:hover .dropdown-menu {
            display: block;
        }
    </style>
</head>

<body class="h-screen w-screen flex flex-col overflow-y-hidden ">
  <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            
            if(session.getAttribute("username")==null)
                response.sendRedirect("stafflogin.jsp");
            %>
    <nav class="w-full flex justify-between px-5  shadow bg-white items-center">
        <div class="flex-1 flex items-center text-xl font-bold  font-header">
            <span class=" overflow-hidden ">
                <img src="img/lab-logo.png" alt="" class="h-16 object-cover">
            </span>
        </div>
        <div class="dropdown-img inline-block relative w-48 py-1 text-right  ">

            <span class="text-red-600 flex list-none justify-center ">
                <img src="img/donor.png " alt="" class="h-12 w-12">
            </span>
            <ul class="dropdown-menu absolute hidden text-gray-700 pt-1 w-full button-0 right-0 mr-1  px-3 ">
                <li
                    class="text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <a href="#" class="rounded-t bg-gray-300 hover:bg-red-600 hover:text-white py-2 px-4 block"
                        href="#">Profile</a>
                </li>
                <li
                    class="text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <a href="staffchangepassword.jsp" class="rounded-t bg-gray-300 hover:bg-red-600 hover:text-white py-2 px-4 block"
                        href="staffchangepassword.jsp">Change Password</a>
                </li>
                <li
                    class="text-center transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <a href="staffLogout"
                        class="bg-gray-300  py-2 px-4 block whitespace-no-wrap hover:bg-red-600 hover:text-white "
                        href="staffLogout">logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <!--content part-->
    <div class="w-full flex justify-center items-center py-5 px-32">
        <table class="table-auto border w-full">
            <thead>
                <tr class="bg-red-700 text-white">
                    <th class="px-4 py-2">ID</th>
                    <th class="px-4 py-2">PATIENT NAME</th>
                    <th class="px-4 py-2">APPOINTMENT TITLE</th>
                    <th class="px-4 py-2">DOCTOR NAME</th>
                    <th class="px-4 py-2">TEST</th>
                    <th class="px-4 py-2">UPLOAD REPORT</th>
                </tr>
            </thead>
            <tbody>
                <tr
                    class="transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-105 hover:bg-gray-200 hover:shadow-sm">
                    <td class="box-border border-b px-4 py-3 text-center">${u.getId()}</td>
                    <td class="box-border border-b px-4 py-3 text-center">${u.getPname()}</td>
                    <td class="box-border border-b px-4 py-3 text-center">${u.getAptitle()}</td>
                    <td class="box-border border-b px-4 py-3 text-center">${u.getDoctor()}</td>
                    <td class="box-border border-b px-4 py-3 text-center">${u.getTest()}</td>
                    <td class="box-border border-b px-4 py-3 text-center"><a href="labUploadRecord.jsp?id=${u.getId()}">Upload</a></span>
                    </td>
                </tr>
                      </tbody>
        </table>
    </div>
</body>

</html>